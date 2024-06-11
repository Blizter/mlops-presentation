import prefect
from prefect import flow, get_run_logger, task


@task
def say_hi():
    logger = get_run_logger()
    logger.info("Hello from the Prefect 2.0 flow! 👋")


@task
def log_platform_info():
    import platform
    import sys

    logger = get_run_logger()
    logger.info("Python version = %s", platform.python_version())
    logger.info("Platform information (instance type) = %s ", platform.platform())
    logger.info("OS/Arch = %s/%s", sys.platform, platform.machine())
    logger.info("Prefect Version = %s 🚀", prefect.__version__)


@flow
def health_check():
    hi = say_hi()
    log_platform_info(wait_for=[hi])
