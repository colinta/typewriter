
class TypewriterView < UIView

  def initWithFrame(frame)
    super
    frame = self.frame  # frame could be [[], []] or a CGRect; normalize it.

    layoutSubviews

    self
  end

  def frame=(new_frame)
    super
    layoutSubviews
  end

  def clear
    @x = 0
    @y = @max_height
  end

  ##|
  ##|  START AT 0, 0, AND START FLOATING
  ##|
  def layoutSubviews
    @x = @y = 0  # the coordinates for the next frame
    @max_height = 0  # the max_height of *all* the rows so far (not just the current row)

    frame = self.frame
    # the width, which is fixed.  when a row would be longer than this, it is
    # wrapped to the next row.
    @fixed_width = frame.size.width

    self.subviews.each do |view|
      add_next(view)
    end
  end

  def add_next(view)
    # ignore the x, y of the added view, we only respect the size
    view_frame = view.frame

    # new row?
    self.clear if @x + view_frame.size.width > @fixed_width

    # new max_height?
    @max_height = @y + view_frame.size.height if @y + view_frame.size.height > @max_height

    view_frame.origin.x = @x
    @x += view_frame.size.width
    view_frame.origin.y = @y

    view.frame = view_frame
  end

end
