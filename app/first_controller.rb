
class FirstController < UIViewController

  def viewDidLoad
    @typewriter = TypewriterView.alloc.initWithFrame([[0, 0], [320, 480]])
    @typewriter.backgroundColor = UIColor.darkGrayColor
    style_portrait

    self.view.addSubview(@typewriter)

    96.times do
      width = (rand() * 30).to_i + 10  # between 10 and 40
      height = (rand() * 50).to_i + 10  # between 10 and 60

      the_view = UIView.alloc.initWithFrame([[0, 0],  [width, height]])

      red =   rand
      green = rand
      blue =  rand
      the_view.backgroundColor = UIColor.colorWithRed(red, green:green, blue:blue, alpha:1)
      @typewriter.addSubview(the_view)
    end
  end

  def style_portrait
    @typewriter.margin = 8
    @typewriter.spacing = 4
    @typewriter.min_width = 40
    @typewriter.min_height = 40
  end

  def style_landscape
    @typewriter.margin = 13
    @typewriter.spacing = 6
    @typewriter.min_width = 40
    @typewriter.min_height = 40
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    true
  end

  def willAnimateRotationToInterfaceOrientation(orientation, duration:duration)
    bframe = @typewriter.frame
    w, h = bframe.size.width, bframe.size.height
    bframe.size = h, w
    @typewriter.frame = bframe

    if orientation == UIInterfaceOrientationPortrait or orientation == UIInterfaceOrientationPortraitUpsideDown
      style_portrait
    else
      style_landscape
    end

    @typewriter.setNeedsLayout
  end

end
