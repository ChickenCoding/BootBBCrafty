#!/usr/bin/env perl

# writeInBBTemplate.pl
# a perl script to write backbone structure and crafty foreach entity
#
#

use strict;
use Switch;

#get the number of arguments passed from bash
my $numArgs = $#ARGV + 1 ;

#loop in it, check if its model / view / colection / crafty exists
#if so, write the corresponding template in it

#directories of backbone structure and crafty
my @dirs = qw(model view collection crafty);

# create  and write in directories for each entity in the game
foreach my $i( 0 .. $numArgs ){
    foreach  ( @dirs ){
        # create the file
        open (my $fileholder, '>', "dev/js/". $_ . '/' . $ARGV[$i] . '.' . $_ . '.js') or die "could not open $!";

        switch ($_){
            case "model" {
                print $fileholder create_model( $ARGV[$i] );
            }
            case "view"{
                print $fileholder create_view( $ARGV[$i] );
                print $_;
            }
            case "crafty"{
                print $fileholder create_crafty( $ARGV[$i] );
                print $_;
            }
        }
        close( $fileholder );

        # write in main.js the link to the corresponding js, for async loading
        register_headjs("js/". $_ . '/' . $ARGV[$i] . '.' . $_ . '.js') ;
    }
}

#write in model/<entity>.model.js to have a bootfile
sub create_model {

    my $x = $_[0];

    my $capitalizedX = ucfirst($x);

    return "
    /**
    *
    * Model  : ${x}.model.js
    */
    window.${capitalizedX} = Backbone.Model.extend({
    \n
    \t// //////////////////////
    \t// Constructor Overriding
    \t// //////////////////////
    \t defaults : {
    \t\t x : 50,
    \t\t y : 50,
    \t\t w : 500,
    \t\t h : 500
    \t}
    });\n
    ";
};

#write in view/<entity>.view.js to have a bootfile
sub create_view{

    my $x = $_[0];

    my $capitalizedX = ucfirst($x);

    return "
    /**
    *
    * View : ${x}.view.js
    */
    window.${capitalizedX}View = Backbone.View.extend({
    \n
    \t Classname : '${capitalizedX}',
    \t// ////////////////////
    \t//  Constructor
    \t// ////////////////////
    \tinitialize : function(){
    \t\t_bindAll(this, 'render');
    \t},

    \t// ////////////////////
    \t//  Render
    \t// ////////////////////
    \trender : function(){
    \t\t//initialize window
    \t\tCrafty.init()
    \t},
    });\n
    ";
};

sub create_collection{
}

#write in crafty/<entity>.crafty.js to have a bootfile
sub create_crafty{
    my $x = $_[0];
    my $capitalizedX = ucfirst($x);
    return "
    /**
    *
    * Crafty entity : ${x}.crafty.js
    *
    */

    // Crafty component
    Crafty.c('${capitalizedX}', {
    \n
    \t// ////////////////////
    \t//  Constructor
    \t// ////////////////////
    \tinit : function(){
    \t\tthis.addComponent('2D, Canvas, Color');
    \t},
    \n
    \tmake${capitalizedX} : function(x, y, w, h, c){
    \t\tconsole.log(\"crafty component ${x} : \" + x + y + w + h + c );
    \t\tthis.attr({
    \t\t\tx\t:\tx,
    \t\t\ty\t:\ty,
    \t\t\tw\t:\tw,
    \t\t\th\t:\th
    \t\t}).color(c);
    \t\treturn this;
    \t}
    });\n
    ";
};

#write in main the corresponding files for the entity, to async loading the files
sub register_headjs{
    my $x = $_[0];
    open(my $fh, '>>dev/js/main.js');
    print $fh "head.js" . "(" . $x . ");\n";
    close($fh);
};

#sub register_model {
#open(my $mainfh, '>>dev/js/main.js');

#}


