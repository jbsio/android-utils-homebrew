class FbInfer < Formula
  desc "Facebook Infer"
  homepage "http://fbinfer.com/"
  version "0.4.0"
  url "https://github.com/facebook/infer/releases/download/v#{version}/infer-osx-v#{version}.tar.xz"
  sha256 "bb84656153b59ff43f477c2432039195b614ecb5c19ed2a3f73aea7921696730"

  depends_on "opam" => :build

  def install
    ENV.deparallelize
    system "bash", "-c", "opam init -y --comp=4.01.0; eval $(opam config env); opam update; opam install -y atdgen.1.6.0 extlib.1.5.4 javalib.2.3.1 sawja.1.5.1"
    system "make", "-C", "infer", "java"
  end

  test do
    system "infer"
  end

  def caveats; <<-EOS.undent
    You will need to add #{HOMEBREW_PREFIX}/bin/infer to your $PATH
    EOS
  end
end
