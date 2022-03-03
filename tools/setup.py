# Copyright

# Setup for 'codewerk' entrypoint

from setuptools import setup

setup(
    name='codewerk',
    version='0.0.1',
    entry_points={
        'console_scripts': [
            'codewerk=codewerk:main'
        ]
    }
)
