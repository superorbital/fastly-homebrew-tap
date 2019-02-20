# This file was generated by GoReleaser. DO NOT EDIT.
class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/v0.3.0/waflyctl_0.3.0_darwin_amd64.tar.gz"
  version "0.3.0"
  sha256 "105a4edae62b337f0ece4654ebfefd038761aadab5e1c767ee50fff7f2826cc4"
  
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
