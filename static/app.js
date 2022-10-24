window.callServerAction = function (action, payload) {
    console.log(event.target);
    var component = findActiveComponent(event.target || document.activeElement);
    var message = JSON.stringify({ action, ...payload });
    component.connection.send(message)
}


$(document).on('ready turbolinks:load', function () {
    // This is called on the first page load *and* also when the page is changed by turbolinks
});