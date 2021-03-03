from pytest import fixture, mark


@mark.xfail
def test_PLEASE_DELETE_ME():
    assert False, "Just checking in and making sure I'm failing LOUD enough"


# https://docs.pytest.org/en/stable/reference.html?highlight=fixture#pytest-fixture
@fixture
def run_main():
    from {{ cookiecutter.project_name }} import main
    return main()


def test_exit_code(run_main):
    assert run_main is None  # exit code


def test_greeting(capsys, run_main):
    # https://docs.pytest.org/en/stable/capture.html
    captured = capsys.readouterr()
    assert captured.out == "Hello World\n"
    assert captured.err == ""
