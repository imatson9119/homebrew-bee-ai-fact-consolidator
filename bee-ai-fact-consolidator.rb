class BeeAiFactConsolidator < Formula
  include Language::Python::Virtualenv

  desc "Tool to consolidate and deduplicate facts from Bee AI using clustering and a local LLM"
  homepage "https://github.com/imatson9119/bee-ai-fact-consolidator"
  url "https://github.com/imatson9119/bee-ai-fact-consolidator/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "381f157adecb174320131cb9309464dcab2475a7bfd42213466c96fefdb4d193"
  license "MIT"

  depends_on "gcc" # For Fortran libraries
  depends_on "python@3.9"

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
  end

  resource "scikit-learn" do
    url "https://files.pythonhosted.org/packages/83/74/f64379a4ed5879d9db744fe37cfe1978c07c66684d2439c3060d19a536d8/scikit_learn-1.6.1-cp39-cp39-macosx_12_0_arm64.whl"
    sha256 "e7be3fa5d2eb9be7d77c3734ff1d599151bb523674be9b834e8da6abe132f44e"
  end

  resource "scipy" do
    url "https://files.pythonhosted.org/packages/32/48/f605bad3e610efe05a51b56698578f7a98f900513a4bad2c9f12df845cd6/scipy-1.12.0-cp39-cp39-macosx_12_0_arm64.whl"
    sha256 "bba1b0c7256ad75401c73e4b3cf09d1f176e9bd4248f0d3112170fb2ec4db067"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/44/2f/62ea1c8b593f4e093cc1a7768f0d46112107e790c3e478532329e434f00b/python_dotenv-1.0.0-py3-none-any.whl"
    sha256 "f5971a9226b701070a4bf2c38c89e5a3f0d64de8debda981d1db98583009122a"
  end

  resource "openai" do
    url "https://files.pythonhosted.org/packages/75/d1/06a969e3b15429873d52cb2ca8ad9b2c3b28bcf977ba6796dbaef13f5b95/openai-1.14.0-py3-none-any.whl"
    sha256 "5c9fd3a59f5cbdb4020733ddf79a22f6b7a36d561968cb3f3dd255cdd263d9fe"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/ae/8c/ab03a7c25741f9ebc92684a20125fbc9fc1b8e1e700beb9197d750fdff88/numpy-1.26.4-cp39-cp39-macosx_11_0_arm64.whl"
    sha256 "52b8b60467cd7dd1e9ed082188b4e6bb35aa5cdd01777621a1658910745b90be"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/2a/14/e75e52d521442e2fcc9f1df3c5e456aead034203d4797867980de558ab34/tqdm-4.66.2-py3-none-any.whl"
    sha256 "1ee4f8a893eb9bef51c6e35730cebf234d5d0b6bd112b0271e10ed7c24a02bd9"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/00/2e/d53fa4befbf2cfa713304affc7ca780ce4fc1fd8710527771b58311a3229/click-8.1.7-py3-none-any.whl"
    sha256 "ae74fb96c20a0277a1d615f1e4d73c8414f5a98db8b799a7931d1582f3390c28"
  end

  def install
    venv = virtualenv_create(libexec, "python3.9")
    
    # Install all wheel resources directly
    resources.each do |r|
      if r.url.end_with?(".whl")
        r.stage do
          venv.pip_install Dir["*.whl"].first
        end
      else
        venv.pip_install r
      end
    end
    
    venv.pip_install_and_link buildpath
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