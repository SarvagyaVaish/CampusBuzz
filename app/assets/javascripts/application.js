// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .


$(document).ready(function() {
  $(".dottify").dotdotdot({
    /*  The HTML to add as ellipsis. */
    ellipsis    : '... ',

  /*  How to cut off the text/html: 'word'/'letter'/'children' */
  wrap      : 'word',

  /*  jQuery-selector for the element to keep and put after the ellipsis. */
  after     : null,

  /*  Whether to update the ellipsis: true/'window' */
  watch     : true,

  /*  Optionally set a max-height, if null, the height will be measured. */
  height      : 30,

  /*  Deviation for the height-option. */
  tolerance   : 0,

  /*  Callback function that is fired after the ellipsis is added,
   *        receives two parameters: isTruncated(boolean), orgContent(string). */
  callback    : function( isTruncated, orgContent ) {},

  lastCharacter : {

    /*  Remove these characters from the end of the truncated text. */
    remove      : [ ' ', ',', ';', '.', '!', '?' ],

    /*  Don't add an ellipsis if this array contains 
     *          the last character of the truncated text. */
    noEllipsis    : []
  }
  });
});

