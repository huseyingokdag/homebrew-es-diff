class EsDiff < Formula
  include Language::Python::Virtualenv

  desc "Compare two Elasticsearch indices and output differences to a CSV file"
  homepage "https://github.com/huseyingokdag/es-diff"
  url "https://github.com/huseyingokdag/es-diff/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "968dcfcde2f8289ac33ace20a3d42bc9059fa542fb1ef6363a10a04e07fa56d0"
  license "MIT"

  depends_on "python@3.12"

  resource "deepdiff" do
    url "https://files.pythonhosted.org/packages/0a/0f/9cd2624f7dcd755cbf1fa21fb7234541f19a1be96a56f387ec9053ebe220/deepdiff-8.5.0.tar.gz"
    sha256 "a4dd3529fa8d4cd5b9cbb6e3ea9c95997eaa919ba37dac3966c1b8f872dc1cd1"
  end

  resource "orderly-set" do
    url "https://files.pythonhosted.org/packages/4a/88/39c83c35d5e97cc203e9e77a4f93bf87ec89cf6a22ac4818fdcc65d66584/orderly_set-5.5.0.tar.gz"
    sha256 "e87185c8e4d8afa64e7f8160ee2c542a475b738bc891dc3f58102e654125e6ce"
  end

  resource "elasticsearch5" do
    url "https://files.pythonhosted.org/packages/7b/88/4034caa9d9ed852e681d1ad1d374aa10046cc9e9cc41ebc70dbccd43ed11/elasticsearch5-5.5.6.tar.gz"
    sha256 "331ce226182c75cfdf6b823f9f30b5a555fa91b85f1d05ac9958758150e2e8c7"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e4/e8/6ff5e6bc22095cfc59b6ea711b687e2b7ed4bdb373f7eeec370a97d7392f/urllib3-1.26.20.tar.gz"
    sha256 "40c2dc0c681e47eb8f90e7e27bf6ff7df2e677421fd46756da1161c39ca70d32"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/es-diff --help")
    assert_match "usage", output
  end
end
