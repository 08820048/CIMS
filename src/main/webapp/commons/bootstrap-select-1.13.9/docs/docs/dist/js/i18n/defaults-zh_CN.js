/*!
 * Bootstrap-select v1.13.9 (https://developer.snapappointments.com/bootstrap-select)
 *
 * Copyright 2012-2019 SnapAppointments, LLC
 * Licensed under MIT (https://github.com/snapappointments/bootstrap-select/blob/master/LICENSE)
 */

(function (root, factory) {
  if (root === undefined && window !== undefined) root = window;
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module unless amdModuleId is set
    define(["jquery"], function (a0) {
      return (factory(a0));
    });
  } else if (typeof module === 'object' && module.exports) {
    // Node. Does not work with strict CommonJS, but
    // only CommonJS-like environments that support module.exports,
    // like Node.
    module.exports = factory(require("jquery"));
  } else {
    factory(root["jQuery"]);
  }
}(this, function (jQuery) {

(function ($) {
  $.fn.selectpicker.defaults = {
    noneSelectedText: 'æ²¡æœ‰é€‰ä¸­ä»»ä½•é¡¹',
    noneResultsText: 'æ²¡æœ‰æ‰¾åˆ°åŒ¹é…é¡¹',
    countSelectedText: 'é€‰ä¸­{1}ä¸­çš„{0}é¡¹',
    maxOptionsText: ['è¶…å‡S¹',
    maxOré¡         e™imoe                        n  ep  ctedT‹               9é»s)Ccte(     S: 'æ²¡æs$.fosoo=LtL  )Cc/‡S¹',
    e¡i/s$.fosr         r  sOt™',
    eLwré     oé     ie   sOt™', Optio‹    oé   r  sOt9é»s)COpt(   ieSext: ['sectosoo;A()nA