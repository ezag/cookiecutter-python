def test_PLEASE_DELETE_ME():
    assert False, "Just checking in and making sure I'm failing LOUD enough"

def test_exit_code():
    from {{ cookiecutter.project_name }} import main
    exit_code = main()
    assert exit_code is None

def test_greeting(capsys):
    # https://docs.pytest.org/en/stable/capture.html
    captured = capsys.readouterr()
    assert captured.out == "Hello World\n"
    assert captured.err == ""
