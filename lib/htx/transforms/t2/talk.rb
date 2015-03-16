# -*- coding: utf-8 -*-
module HTX

  # Tranform `<talk>` to a talk bubble.
  #
  # Example input:
  #
  #     <talk>Hello</talk>
  #
  # Example output:
  #
  #    <img width="200" height="16" src="/img/rounded/talk-200-top.gif" alt="*">
  #    <div class=testimonial><blockquote>Hello</blockquote></div>
  #    <img width="200" height="50" src="/img/rounded/talk-200-bottom.gif" alt="*">
  #    <br>
  #
  def htx_t2_talk(s)
    return '<img width="200" height="16" src="/img/rounded/talk-200-top.gif" alt="*"><div class=testimonial><blockquote>' + s + '</blockquote></div><img width="200" height="50" src="/img/rounded/talk-200-bottom.gif" alt="*"><br>'
  end

end
