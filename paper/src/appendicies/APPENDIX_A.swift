	import Foundation

	func arrayToString(p : [Double]) -> String {
		var result : String = "";
		
		for e in p {
			result += "\(e), ";
		}
		
		return result;
	}

	func compute(p : Double...) -> Double {
		return compute(p);
	}

	func compute(p : [Double]) -> Double {
		var result : Double = 0.0;
		var m : Double = 0.3;
		
		for var i = 0; i < p.count; i++ {
			m += p[i] * 0.1;
			result += m * (1 - p[i]);
		}
		
		return result;
	}

	func run(rounds : Int, step : Double) -> String {
		var best : Double = 0.0;
		var p = [Double](count: rounds, repeatedValue: 0.0);
		var result : String = "";
		
		for i in 0...(rounds-1) {
			
			print("Changing \(i+1)-th proportion");
			
			for p[i] = 0.0; p[i] < 1.0; p[i] += step {
				
				let res = compute(p);
				result += "\(Double(i) + p[i])\t\(res)\n";
				
				if res > best {
					best = res;
				}
				
				print("\tres: \(String(format: "%.3f", res));\tvalues: \(arrayToString(p))");
			}
			
			p[i] = 1.0;
		}
		
		print("Result");
		print("\tBest value: \(best)");
		print("\tMax payout: \(4 * best) USD");
		
		return result;
	}

	run(10, step: 0.1);
