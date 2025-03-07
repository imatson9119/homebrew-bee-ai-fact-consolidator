class BeeAiFactConsolidator < Formula
  include Language::Python::Virtualenv

  desc "Tool to consolidate and deduplicate facts from Bee AI using clustering and a local LLM"
  homepage "https://github.com/imatson9119/bee-ai-fact-consolidator"
  url "https://github.com/imatson9119/bee-ai-fact-consolidator/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "14c26f2b0c215f38db39d7dddd224daf03f06c5cefbaff15ae2f534e537d7d1d"
  license "MIT"

  depends_on "python@3.9"

  def install
    virtualenv_create(libexec, "python3.9")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      To use bee-ai-fact-consolidator, you need to set up your environment:
      
      The first time you run the tool, you will be prompted for:
      1. Your Bee AI API token (get one from https://developer.bee.computer)
      2. Your LLM API URL (default: http://localhost:1234/v1)
      
      Make sure your local LLM is running with LM Studio at http://localhost:1234/v1
      before running the tool.
    EOS
  end

  test do
    # Add a basic test to ensure the executable runs
    assert_match "Usage:", shell_output("#{bin}/bee-fact-consolidator --help")
  end
end 