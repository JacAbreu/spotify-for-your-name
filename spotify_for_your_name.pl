#!/usr/bin/env perl

use strict;
use warnings;

use Mojolicious::Lite;
use JSON;
use Text::Unaccent;
use HTML::Entities;
use Encode;

get '/' => 'index';

get '/login' => 'login';

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
                    <a href="/login" class="btn btn-primary">Log in with Spotify</a>
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
