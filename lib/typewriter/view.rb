# An easy-to-grok box-model.  It just lays views out side-by-side, from
# left-to-right until the frame width is reached, and then drops down to the
# next row.
class TypewriterView < UIView

  attr_accessor :vertical_spacing, :horizontal_spacing
  attr_accessor :top_margin, :bottom_margin
  attr_accessor :left_margin, :right_margin

  def initWithFrame(frame)
    super

    self.spacing = 0
    self.margin = 0

    self
  end

  def spacing=(spacing)
    @horizontal_spacing = @vertical_spacing = spacing
  end

  def margin=(margin)
    @top_margin = @bottom_margin = @left_margin = @right_margin = margin
  end

  def clear
    @x = @left_margin
    @y = @max_height
    # only add the horizontal_spacing after at least one row has been written
    if @y > @top_margin
      @y += @horizontal_spacing
    end
  end

  ##|
  ##|  START AT 0, 0, AND START FLOATING
  ##|
  def layoutSubviews
    # the max_height of *all* the rows so far (not just the current row)
    @max_height = @top_margin
    self.clear

    # when a row would be longer than this, it is wrapped to the next row.
    @max_x = self.frame.size.width - @right_margin

    self.subviews.each do |view|
      add_next(view)
    end
  end

  def add_next(view)
    view_frame = view.frame

    # move to the next new row?
    next_x = @x + view_frame.size.width
    if next_x > @max_x
      self.clear
      next_x = @x + view_frame.size.width
    end

    # new max_height?
    next_y = @y + view_frame.size.height
    @max_height = next_y if next_y > @max_height

    view_frame.origin.x = @x
    @x = next_x + horizontal_spacing
    view_frame.origin.y = @y

    view.frame = view_frame
  end

end
