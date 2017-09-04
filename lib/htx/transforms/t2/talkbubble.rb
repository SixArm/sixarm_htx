# -*- coding: utf-8 -*-
=begin

Tranform `<talkbubble>` to a talk bubble.

Example input:

    <talkbubble>Hello</talkbubble>

Example output:

    <img width="200" height="16" src="/img/rounded/talk-200-top.gif" alt="*">
    <div class=testimonial><blockquote>Hello</blockquote></div>
    <img width="200" height="50" src="/img/rounded/talk-200-bottom.gif" alt="*">
    <br>

class TalkBubble < HTX::Transforms

  def tr(s)
    '<img width="200" height="16" src="/img/rounded/talk-200-top.gif" alt="*"><div class=testimonial><blockquote>' + s + '</blockquote></div><img width="200" height="50" src="/img/rounded/talk-200-bottom.gif" alt="*"><br>'
  end

end
