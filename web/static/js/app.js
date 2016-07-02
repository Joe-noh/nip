import "phoenix_html"

import socket from "./socket";
import m from 'mithril';

class NippoChannel {
  constructor() {
    this.channel = socket.channel("rooms:nippo", {});

    this.channel.join()
      .receive("ok", resp => { console.log("Joined successfully", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })
  }

  onNewNippo(callback) {
    this.channel.on("nippo:new", callback);
  }

  push(name, body) {
    this.channel.push("nippo:create", {name, body}).receive("ok", resp => {});
  }
}

class NippoSpeaker {
  constructor() {
    this.synthes = new SpeechSynthesisUtterance({lang: "ja-JP"});
  }

  speak(name, body) {
    let text = `${name}さんの日報です。${body}`;

    this.synthes.text = text;
    speechSynthesis.speak(this.synthes);
  }
}

let App = {
  controller: function() {
    this.nippoChannel = new NippoChannel();
    this.nippoSpeaker = new NippoSpeaker();

    this.nippoChannel.onNewNippo(message => {
      let {name, body} = message;
      this.nippoSpeaker.speak(name, body);
    });

    this.name = m.prop("");
    this.body = m.prop("");

    this.submit = () => {
      this.nippoChannel.push(this.name, this.body);
    };
  },

  view: function(ctrl) {
    return [
      m("div", [
        m("input", {
          onchange: m.withAttr("value", ctrl.name),
          value: ctrl.name(),
          placeholder: "あだ名"
        })
      ]),
      m("div", [
        m("textarea", {
          onchange: m.withAttr("value", ctrl.body),
          value: ctrl.body(),
          placeholder: "今日はどんな1日でしたか",
          style: `
            height: 300px;
          `
        })
      ]),
      m("button", {onclick: ctrl.submit}, "ほぞん")
    ]
  }
};

m.mount(document.getElementById('app'), App);
