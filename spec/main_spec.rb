describe "Application 'typewriter'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

  it "has a rootViewController" do
    @app.windows[0].rootViewController.nil?.should != true
  end

  it "has a subview, same as its rootViewController" do
    @app.windows[0].subviews.length.should == 1

    @app.windows[0].subviews[0].should == @app.windows[0].rootViewController.view
  end

  it "has a TypewriterView" do
    typewriter = @app.windows[0].subviews[0].subviews[0]
    typewriter.class.name.should == "TypewriterView"
  end

  describe "adding subviews to typewriter" do

    before do
      @app = UIApplication.sharedApplication
      @typewriter = @app.windows[0].subviews[0].subviews[0]
    end

    it "has a bunch of subviews" do
      @typewriter.subviews.length.should > 1
    end

    it "should not have overlapping subviews" do
      @typewriter.subviews.each { |subview|
        @typewriter.subviews.select {|v| v != subview }.each { |check|
          CGRectIntersectsRect(subview.frame, check.frame).should == false
        }
      }
    end

  end

end
