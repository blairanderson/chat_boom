//= require app/runner

/**
 * Created by blairanderson on 10/24/14.
 */

//read-> http://benvinegar.github.io/seamless-talk/

function observeUpdate(changes) {
  changes.forEach(function (change) {
    // Letting us know what changed
    if (change.type === "add") {
      var payload = change.object[0][1];
      var site_id = payload.app_id;
      delete payload.app_id;
      payload.href = window.location.href;
      var data = {
        site_id: site_id,
        event: payload
      };
      var request = new XMLHttpRequest();
      request.open('POST', "<%= events_url %>", true);
      request.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
      request.send(JSON.stringify(data));
      request.onloadend = function () {
        // callback
      };
    }

  });
}

Object.observe(ChatBoom.q, observeUpdate);
ChatBoom('update', chatBoomSettings);

if (chatBoomSettings.liveChat !== false) {
  el = document.createElement('div');
  el.id = "chatboom-widget";
  debugger
  document.body.appendChild(el);
  el.innerHTML = "<h1>YOLOY</h1>"
}
