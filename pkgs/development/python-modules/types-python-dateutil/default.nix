{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "types-python-dateutil";
  version = "2.8.19.20240106";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-H42yIcO5jmygLqg6WDcbIsN09Crlu98YbbnJp2WBRZ8=";
  };

  # Modules doesn't have tests
  doCheck = false;

  pythonImportsCheck = [
    "dateutil-stubs"
  ];

  meta = with lib; {
    description = "Typing stubs for python-dateutil";
    homepage = "https://github.com/python/typeshed";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
