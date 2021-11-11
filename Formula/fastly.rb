# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v1.1.1/fastly_v1.1.1_darwin-arm64.tar.gz"
      sha256 "206c0eb82bf27fb4e91b333a6c5fc0c1199ede3682d9fc544bd49f6cb2f430e8"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v1.1.1/fastly_v1.1.1_darwin-amd64.tar.gz"
      sha256 "29b47508a1163247ccc7bc3027e31ae7258d5f6905d0e6669d6ca89d8c6cd32b"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v1.1.1/fastly_v1.1.1_linux-arm64.tar.gz"
      sha256 "de6e3efb49039f8f03d6cb84ba692c99cbdde751df8de1301ae33e38f2ec41d9"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v1.1.1/fastly_v1.1.1_linux-amd64.tar.gz"
      sha256 "822dbaed997ecaa6456e712a6aa09646dc884cb96fd4eb078a3bd020ca3ff8c2"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  head do
    url "https://github.com/fastly/cli.git"
    depends_on "go"
  end

  test do
    help_text = shell_output("#{bin}/fastly --help")
    assert_includes help_text, "Usage:"
  end
end
