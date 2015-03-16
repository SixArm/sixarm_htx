# -*- coding: utf-8 -*-
module HTX

              #
Tranform `<email>{{address}}</email>` to an email link that uses display:none obfuscation.

Example input:

  <email>alice@example.com</email>

Example output:

  alice<span display:none>@</span>example.com


Does email address obfuscation actually work? Yes, when we use "display:none".

See http://superuser.com/questions/235937/does-email-address-obfuscation-actually-work


    def htx_t2_email(e)
    user, host = e.text.split(/\@/)
    e.text = ''
    return Text.new(user), Element.new_with_options(:name => 'span', :attributes => "display:none", :text => '@'), Text.new(host)
  end
end
