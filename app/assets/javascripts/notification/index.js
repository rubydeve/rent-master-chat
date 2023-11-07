$(document).on('turbolinks:load', function() {
    return App.room = App.cable.subscriptions.create({
      channel: "NotificationChannel"
    }, {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        if(!data.by){
          var already = $(`#${data.chatroom_id}`)
          if(already.length){
            already.prependTo(".contacts-list");
            already.find('.icon-shape.icon-xs.text-white.bg-danger.rounded-circle.fw-bold.fs-6').text(data.unread)
          }else{
            $('.contacts-list').prepend(`
              <li class=" py-3 px-4 chat-item contacts-item" id="${data.chatroom_id}">
                <div class="d-flex justify-content-between align-items-center helper-chat" data-info="${data.chatroom_id}">
                  <a class="text-link contacts-link" href="/chats/${data.chatroom_id}">
                    <div class="d-flex">
                      <div class=" ms-2">
                        <h5 class="mb-0">${data.info}</h5>
                      </div>
                    </div>
                  </a>            
                <div>
                <div class="text-end">
                    <span class="icon-shape icon-xs text-white bg-danger rounded-circle fw-bold fs-6">${data.unread}</span>
                </div>
              </li>
            `)
          }
        }
      }
    });
});