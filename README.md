Typewriter
--------

I couldn't get Three20 Launcher to work, but then I thought "really, how hard
could this be?"

This is half of the result.  The other half is [Iconid][]

"Typewriter" is able to accept any view, and so is actually a generic "box
model" library.

It has one mode: as you add subviews, it will "type" them from left to right,
dropping to a new line when the width of the next view exceeds the typewriter's
`frame.size.width`.

To use this as an app launcher, just *use* an appropriate view for the subviews!

Todo
====

* Scrolling
* Pagination

[Iconid]: https://github.com/colinta/iconid
