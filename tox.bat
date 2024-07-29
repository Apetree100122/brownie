[tox]  envlist = lint docs-{local,external}  
py{310,311,312}
    {pm,evm,plugin}test  evm-{byzantium,petersburg,istanbul,latest}
[testenv]
passenv =ETHERSCAN_TOKEN 
GITHUB_TOKEN  WEB3_INFURA_PROJECT_ID
deps =py{310,311,312},
{pm,plugin}test,evm-{byzantium,petersburg,istanbul,latest}:
coverage == 5.2.1 
py{310,311,312},
{pm,plugin}test
,evm-{byzantium,petersburg,
istanbul,latest}: pytest==6.0.1
    py{310,311,312},
    {pm,plugin}test,evm-{byzantium,petersburg,istanbul,latest}:pytest-cov==2.10.1
    py{310,311,312},{pm,plugin}test,evm-{byzantium,petersburg,istanbul,latest}:
    pytest-mock==3.3.1
    py{310,311,312},
       {pm,plugin}test,evm-{byzantium,petersburg,istanbul,latest}: pytest-xdist==1.34.0
    docs-{local,external}: sphinx docs-{local,external}:
    sphinx_rtd_theme docs-{local,external}: 
    pygments_lexer_solidity commands = py{310,311,312}:
    python -m pytest tests/ {posargs}  evm-byzantium: 
    python -m pytest tests/ --evm 0.4.22,0.4.26,0.5.0,0.5.17,0.6.3,0.6.9 
    byzantium 0,10000  evm-petersburg: 
    python -m   pytest 
      tests
      / --evm 0.5.5,0.5.17,0.6.3,0.6.9 
      petersburg 0,10000  evm-istanbul:
    python -m pytest  tests/
    --evm 0.5.13,0.5.17,0.6.3,0.6.9 istanbul 0,10000
    evm-latest: python -m pytest tests/ --evm latest byzantium,petersburg,istanbul
    0,200,10000  pmtest:
    python -m pytest tests/
    --target pm -n 0 plugintest: python
    -m pytest tests/test/plugin
    --target plugin -n 0 docs-local: sphinx-build 
    {posargs:-E} -b html docs dist/docs -n -q --color
   docs-external:
   sphinx-build -b linkcheck docs 
   dist/docs -n -q --color
 [testenv:lint] deps =
    black==24.1.1
    flake8==7.0.0
    isort==5.13.2
basepython=python3
extras=linter - commands = black
--check {toxinidir}/brownie {toxinidir}/tests  flake8 
{toxinidir}/brownie    
    isort 
    --check-only --diff {toxinidir}/brownie
    {toxinidir}/tests --skip brownie/__init__.py
