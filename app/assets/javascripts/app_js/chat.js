$(".contacts-list .contacts-link").on("click", function (e) {
    e.preventDefault()
  // $(".chat-body").addClass("chat-body-visible");
}),
$("[data-close]").on("click", function (c) {
    c.preventDefault(), $(".chat-body").removeClass("chat-body-visible");
});
