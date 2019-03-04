# This file was generated by GoReleaser. DO NOT EDIT.
class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/v0.3.1/waflyctl_0.3.1_darwin_amd64.tar.gz"
  version "0.3.1"
  sha256 "3ff929b38d579cfa8bfa045a8f0c13cce1ad7c04f5f69c8e59530d76b5a69c68"
  
  head do
    url "https://github.com/fastly/waflyctl.git"
    depends_on "dep" => :build
    depends_on "go" => :build
  end

  def install
    if build.head?
      ENV["GOPATH"] = buildpath
      (buildpath/"src/github.com/fastly/waflyctl").install buildpath.children
      cd "src/github.com/fastly/waflyctl" do
        system "dep", "ensure", "-vendor-only"
        system "go", "build", "-o", buildpath/"waflyctl"
      end
    end
    
    bin.install "waflyctl"
  end

  test do
    system "#{bin}/waflyctl"
  end
end
