
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require app_js/chat
//= require app_js/simplebar.min
//= require app_js/bootstrap.bundle.min


var bars = []
window.simplebars = function(){
    var simples = $('div[data-bar=""]')
    simples.each((_,el) => {
        var bar = new SimpleBar(el, { autoHide: false });
        bars.push(bar)
    });
}
$('document').ready(function(){
    window.simplebars()
}) 


