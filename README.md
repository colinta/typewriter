Typewriter
--------

I couldn't get Three20 Launcher to work, but then I thought "really, how hard
could this be?"

This is half of the result.  The other half is [Iconned][].

"Typewriter" is able to accept any type of view, not just "app launcher" views.
It is a generic "box model" view.

It doesn't do any drawing of its own, outside the usual `UIView` drawing code.

It has one feature: as you add subviews, it will "type" them from left to right,
like a typewriter, dropping to a new line when the width of the next view exceeds
the typewriter's `frame.size.width`.

To use this as an app launcher, just use an appropriate view for the subviews,
and set some reasonable margins and spacing!

Spacing
====

You can set spacing between views:

```ruby
view.spacing = 10
# same as:
view.vertical_spacing = 10
view.horizontal_spacing = 10
```

Margins
====

You can set top, left, and right margins.  You can set a bottom margin, too, but
it doesn't do anything right now (not until scrolling or pagination are
implemented)

```ruby
view.margin = 20
view.top_margin = 20
view.bottom_margin = 20
view.left_margin = 20
view.right_margin = 20
```

Todo
====

* Scrolling
* Pagination

[Iconned]: https://github.com/colinta/iconned
