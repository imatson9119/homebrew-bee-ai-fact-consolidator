class BeeAiFactConsolidator < Formula
  include Language::Python::Virtualenv

  desc "Tool to consolidate and deduplicate facts from Bee AI using clustering and a local LLM"
  homepage "https://github.com/imatson9119/bee-ai-fact-consolidator"
  url "https://github.com/imatson9119/bee-ai-fact-consolidator/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256_AFTER_RELEASE"
  license "MIT"

  depends_on "python@3.9"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/71/da/e94e26401b62acd6d91df2b52954aceb7f561743aa5ccc32152886c76c96/certifi-2024.2.2.tar.gz"
    sha256 "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/bf/3f/ea4b9117521a1e9c50344b909be7886dd00a519552724809bb1f486986c2/idna-3.6.tar.gz"
    sha256 "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
  end

  resource "joblib" do
    url "https://files.pythonhosted.org/packages/15/0f/d3b2ad8f124b8a8f83e5c97c0c342c43fc7f61e4c0666b15aa014c7ab43e/joblib-1.3.2.tar.gz"
    sha256 "92f865e621e17784e7955080b6d042489e3b8e294949cc44c6eac304f59772b1"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/65/6e/09db70a523a96d25e115e71cc56a6f9031e7b8cd166c1ac8438307c14058/numpy-1.24.4.tar.gz"
    sha256 "80f5e3a4e498641401868df4208b74581206afbee7cf7b8329daae82676d9463"
  end

  resource "openai" do
    url "https://files.pythonhosted.org/packages/5e/a8/f8d00d844c2e79d9480eb93e9a1ca0e0fd6abf1a9f563c5f0b7a9d3a0d06/openai-1.12.0.tar.gz"
    sha256 "bb91fb7db6bb32bb6d5c9e7c5fd9b270d7b9ffc61b8cd217eb6ae2a35c221cec"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/bc/57/e84d88dfe0aec03b7a2d4327012c1627ab5f03652216c63d49962c9f983c/python-dotenv-1.0.0.tar.gz"
    sha256 "a8df96034aae6d2d50a4ebe8216326c61c3eb64836776504fcca410e5937a3ba"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
  end

  resource "scikit-learn" do
    url "https://files.pythonhosted.org/packages/c7/bb/9e7e483c80cce8f1d2d95dbb3b9384a10f5d3c1df58d1d3d1b9ec6ee2b10/scikit-learn-1.3.2.tar.gz"
    sha256 "a2f54c76accc15a34bfb9066e6c7a56c1e7235dda5762b990792330b52ccfb05"
  end

  resource "scipy" do
    url "https://files.pythonhosted.org/packages/60/e3/c5c4c69daa4757e72c54bc21e4c6e0d8c5d3ef1c6c9d81c5a2dbc114e8a1/scipy-1.11.4.tar.gz"
    sha256 "90a2b78e7f5733b9de748f589f09225013685f9b218275257f8a8168ededaeaa"
  end

  resource "threadpoolctl" do
    url "https://files.pythonhosted.org/packages/81/12/fd4dea011af9d69e1cad05a4fcd9a462eb0f9670f6035805b58c3b8abfa4/threadpoolctl-3.2.0.tar.gz"
    sha256 "c96a0ba3bdddeaca37dc4cc7344aafad41cdb8c313f74fdfe387a867bba93355"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/ea/85/3ce0f9f7d3f596e7ea57f4e5ce8c18cb44e4a9daa58ddb46ee0d13d6bff8/tqdm-4.66.2.tar.gz"
    sha256 "6cd52cdf0fef0e0f543299cfc96fec90d7b8a7e88745f411ec33eb44d5ed3531"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/7a/50/7fd50a27caa0961c1526c14c1492d2179df0e69e3c2c5a5a5fe2056bac0f/urllib3-2.2.0.tar.gz"
    sha256 "051d961ad0c62a94e50ecf1af379c3aba8c0fdd09765a5714df3b8c9b2121e45"
  end

  def install
    virtualenv_install_with_resources
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