Gem::Specification.new do |spec|
    spec.name          = "student_report_manager"
    spec.version       = "0.1.0"
    spec.summary       = "CLI tool for managing student reports"
    spec.authors       = ["Abdelrahman Abobakr"]
    spec.files         = Dir["lib/**/*.rb"] + ["bin/report_tool", "data/students.txt"]
    spec.executables   = ["report_tool"]
    spec.require_paths = ["lib"]
  end
  