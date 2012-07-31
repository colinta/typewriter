# This view makes it self big enough that it can contain its child view (it
# only expects to have one) with the margins specified, and positions the child
# view accordingly.
class MarginView < UIView
  attr_accessor :top_margin, :bottom_margin
  attr_accessor :left_margin, :right_margin

  # Accepts an integer, or an array of integers.  Follows CSS-like assignment:
  #
  # 1 argument => top==bottom==left==right
  # 2 arguments => top==bottom, left==right
  # 3 arguments => top, bottom, left==right
  # 4 arguments => top, bottom, left, right
  def margin=(margins)
    return margins = [margins] unless margins.is_a? Array

    case margins.length
    when 1
      @top_margin = @bottom_margin = @left_margin = @right_margin = margins[0]
    when 2
      @top_margin = margins[0]
      @bottom_margin = margins[0]
      @left_margin = margins[1]
      @right_margin = margins[1]
    when 3
      @top_margin = margins[0]
      @bottom_margin = margins[2]
      @left_margin = margins[1]
      @right_margin = margins[1]
    when 4
      @top_margin = margins[0]
      @right_margin = margins[1]
      @bottom_margin = margins[2]
      @left_margin = margins[3]
    else
      raise "Too many arguments (#{margins.length}) sent to MarginView#margin"
    end

    margins
  end

  ##|  DEFAULTS
  def top_margin
    @top_margin ||= 0
    @top_margin
  end
  def bottom_margin
    @bottom_margin ||= 0
    @bottom_margin
  end
  def left_margin
    @left_margin ||= 0
    @left_margin
  end
  def right_margin
    @right_margin ||= 0
    @right_margin
  end
  def didAddSubview(view)
    self.layoutIfNeeded
  end
  def layoutIfNeeded
    super
    if self.subviews[0]
      myframe = self.frame

      self.subviews[0].layoutIfNeeded
      subframe = self.subviews[0].frame

      subframe.origin = [left_margin, top_margin]
      myframe.size = [left_margin + subframe.size.width + right_margin, top_margin + subframe.size.height + bottom_margin]

      if self.subviews[0].frame != subframe
        self.subviews[0].frame = subframe
      end

      if self.frame != myframe
        self.frame = myframe
        superview.layoutIfNeeded if superview
      end
    end
  end

end
