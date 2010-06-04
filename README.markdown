# Extra Variant

## Description

This extension allows you to add an infinite number of variants to your product without
having to create individual variants in the database.

I built this after realizing that I would need about 20,000 variants PER PRODUCT for an
online paint store I was building (2 sizes * 4 finishes * about 2500 colors). This was
obviously unacceptable, both from a performance and UI point of view.

By using Extra Variant, I effectively removed the paint colors from the native variants,
allowing me to only have 8 variants per product (2 sizes * 4 finishes).

Extra Variant adds a field called *extra_variant* to the Add to Cart HTML form. The
value contained in this field is captured at checkout by the extension. The field
can be of any type: text, radio, checkbox, hidden.

In my particular situation, I created an overlay window that allows the user to search and
select a paint color. Some Javascript code then fills out the hidden extra_variant field.

## Demo

You can see Extra Variant in action with the included demo. It is located in the
./demo directory). I included 2 products: a t-shirt and an iPod.

Play with the demo to see what you can do. The t-shirt example is more advanced. An overlay
window opens where the user can chose a color. The iPod example is basic, a text field is
displayed.

The admin user name is: admin@example.org
And the password is: swordfish

## Installation

For git users:

<code>git submodule add git://github.com/cmer/spree-extra-variant.git vendor/extensions/extra-variant</code>

for others (or git users that don't like submodules):

<code>ruby script/extension install git://github.com/cmer/spree-extra-variant.git</code>

## Customization

Adding an extra variant field to your products is very easy. Simply follow these steps:

1. Install the extension (duh!)
2. Migrate the database (*rake db:migrate*)
3. Add a special property to the product in need of an extra variant. The property
   should be called &extra_variant (with the leading &) and the value should be the type of extra variant
   you are adding. For example: *tshirt_color*. It is important that the value does NOT contain spaces or hyphens.
4. Once you have added the special property to your product, you need to craft some HTML. If your property
   value is tshirt_color, you should edit the file at *./spree_app/vendor/extensions/extra_variant/app/views/products/_tshirt_color.haml*.
   If you prefer ERB to Haml, replace the extension for .erb. A simpler example to look at is *_engraved_text.haml*.
5. Restart your app and you should now see your new field when you visit your product page.

You can get creative with Extra Variant. All that matters to the extension is the value contained in the "extra_variant"
form field. The field can be populated by manually or by Javascript, it really doesn't matter.


## Credits

Created by Carl Mercier (carl carlmercier com)


## License

Copyright (c) 2010, Carl Mercier
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
    * Neither the name of the Marcin Raczkowski nor the names of its
      contributors may be used to endorse or promote products derived from this
      software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
