class HelloWorld < Formula

  desc "Docker command driven by your environment"
  homepage "https://github.com/gerardnico/dockenv"
  url "https://github.com/gerardnico/dockenv/get/HEAD.zip", :using => :curl
  #url "https://github.com/yourusername/your-repo/archive/refs/tags/v1.0.0.tar.gz"

  def install
    # Install all bash scripts to the bin directory
    bin.install Dir["bin/*"]

    # Optionally, rename scripts to remove the .sh extension
    # bin.children.each do |script|
    #   mv script, script.sub(/\.sh$/, "") if script.extname == ".sh"
    # end
  end

  def caveats
    <<~EOS
      The following scripts have been installed:
      
      - script1: Description of script1
      - script2: Description of script2
      - script3: Description of script3
    EOS
  end

  test do
    # Add tests for your scripts here
    system "#{bin}/script1", "--version"
    system "#{bin}/script2", "--help"
  end
end