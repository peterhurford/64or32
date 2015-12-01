##[64or32.com](http://64or32.com)

A website and library to determine if your computer is 64-bit or 32-bit

* * *

The libraries provided in the repo come pre-minified for your ease of use.

If you are **using jQuery** on your project you can use the *slightly smaller* `64or32-jquery.min.js`.

If you are **not using jQuery** on your project, you can use the *lightly more performant* `64or32-no-jquery.min.js`.

* * *

#### How to use this library

* **Pick** one of the minified `.js` files as noted above and **save** it to your project
* **Link** to it at the bottom of your page with a script tag like so:
```javascript
<script src="64or32-no-jquery.min.js"></script>
```
or
```javascript
<script src="64or32-jquery.min.js"></script>
```
* **Add** one of these **classes** to any element on the page that you only want to be displayed if that architecture is detected:
 * `unknown`
 * `mobile`
 * `arch32`
 * `arch64`
* And finally, **add** this to your **CSS**
```css
/* Hide all Architecture specific HTML on page load */
.unknown,
.mobile,
.arch32,
.arch64 {
    display: none;
}

/* Only display the content if the JS added a matching class to the HTML tag */
html.unknown,
html.mobile,
html.arch32,
html.arch64,
html.unknown .unknown,
html.mobile .mobile,
html.arch32 .arch32,
html.arch64 .arch64 {
    display: block;
}
```

* * *

#### FAQ

**Q:** If that CSS is needed for this to work, why isn't the library adding it in automatically?  
**A:** Because if the user doesn't have JavaScript enabled, then the CSS will never load. It's safer to let developers choose what the CSS will do by default in case a user doesn't have JavaScript turned on.

* * *

#### License

This library uses the MIT open source software license. It means you can use this for whatever you want, including commercial uses and making changes to it, you just need to leave the top line of the file `//64or32.com | MIT License` in place.
