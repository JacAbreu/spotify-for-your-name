#!/usr/bin/env perl

use strict;
use warnings;

use Mojolicious::Lite;
use JSON;
use Text::Unaccent;
use HTML::Entities;
use Encode;
use LWP::UserAgent;
use HTTP::Request::Common;
use Cwd 'abs_path';
use Data::Random::String;
use WWW::Spotify;

my $ua = LWP::UserAgent->new;
my $client_id = 'ce967e5f094e4cd8adbf6a388a9a0564';
my $client_secret = '3cfede2c192c452cab24d675d486e8fd';
my $redirect_uri = abs_path($0);
my $scope = 'user-read-private user-read-email';

my $state = Data::Random::String->create_random_string(length=>'16', contains=>'alpha');

my $spotify = WWW::Spotify->new();

get '/' => sub{

    $spotify->oauth_client_secret( $client_secret );
    $spotify->oauth_client_id( $client_id );
   
    say $redirect_uri . '/' ;
    my $content = $ua->request(POST 'https://accounts.spotify.com/authorize?', 
        [ response_type => 'code',
            client_id => $client_id,
            scope => $scope,
            redirect_uri => $redirect_uri,
            state => $state ])->as_string();;
   
    say $content; 
            
};

get '/playlist' => sub{

}



app->start;

__DATA__

@@ index.html.ep
<!DOCTYPE html>
    <html>
        <head>
            <title>Example of the Authorization Code flow with Spotify</title>
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        </head>
        <body>
            <div class="container">
                <div id="login">
                    <h1>This is an example of the Authorization Code flow</h1>
                    <a href="/authorization" class="btn btn-primary">Log in with Spotify</a>
                    </div>
                    <div id="loggedin">
                    <div id="user-profile">
                    </div>
                    <div id="oauth">
                    </div>
                        <button class="btn btn-default" id="obtain-new-token">Obtain new token using the refresh token</button>
                </div>
            </div>
        <body>
    </html>

@@login.html.ep
<!doctype html>
    <html>
        <head>
            <title>testando</title>
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
            <style type="text/css">
                #login, #loggedin {
                display: none;
                }
                .text-overflow {
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    width: 500px;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div id="login">
                    <h1>Login</h1>
                </div>
            </div>
        </body>
    </html>
