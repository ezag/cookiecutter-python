def test_PLEASE_DELETE_ME():
    assert False, "Just checking in and making sure I'm failing LOUD enough"

def test_hello_world():
    from {{ cookiecutter.project_name }} import main
    exit_code = main()
    assert exit_code == 0
