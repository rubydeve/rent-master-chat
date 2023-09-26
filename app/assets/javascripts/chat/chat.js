$(document).ready(function(){

var element = $('.floating-chat');
var element1 = $('.close');


setTimeout(function() {
    element.addClass('enter');
}, 1000);

element.click(openElement);
element1.click(closeElement)
function openElement() {
    var messages = element.find('.messages');
    element.find('>i').hide();
    element.addClass('expand');
    element.find('.chat').addClass('enter');
    element.off('click', openElement);
    element.find('.header button').click(closeElement);
    messages.scrollTop(messages.prop("scrollHeight"));
    window.parent.postMessage({message: 'open'}, '*');
}

function closeElement() {
    element.find('.chat').removeClass('enter').hide();
    element.find('>i').show();
    element.removeClass('expand');
    element.find('.header button').off('click', closeElement);
    setTimeout(function() {
        element.find('.chat').removeClass('enter').show()
        element.click(openElement);
    }, 500);
    window.parent.postMessage({message: 'close'}, '*');
}

})
