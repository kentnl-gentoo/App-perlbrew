#!/usr/bin/env perl
use strict;
use warnings;
use Test::Spec;
use Path::Class;
use IO::All;
use File::Temp qw( tempdir );

$ENV{PERLBREW_ROOT} = my $perlbrew_root = tempdir( CLEANUP => 1 );
$ENV{PERLBREW_HOME} = my $perlbrew_home = tempdir( CLEANUP => 1 );

use App::perlbrew;

describe "App::perlbrew" => sub {
    my $app;

    before each => sub {
        $app = App::perlbrew->new;
    };

    it "should be able to run 'display-bashrc' command" => sub {
        ok $app->can("run_command_display_bashrc");
    };

    it "should be able to run 'display-cshrc' command" => sub {
        ok $app->can("run_command_display_cshrc");
    };
};

runtests unless caller;
