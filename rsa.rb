require "openssl"

def sqrt(a)
  begv = 1
  endv = a
  while endv > begv + 1
     mid = (endv + begv)/2
     if mid ** 2 <= a
        begv = mid
     else
        endv = mid
     end
  end
  return begv 
end

N = 179769313486231590772930519078902473361797697894230657273430081157732675805505620686985379449212982959585501387537164015710139858647833778606925583497541085196591615128057575940752635007475935288710823649949940771895617054361149474865046711015101563940680527540071584560878577663743040086340742855278549092581
CIPHERTEXT =  22096451867410381776306561134883418017410069787892831071731839143676135600120538004282329650473509424343946219751512256465839967942889460764542040581564748988013734864120452325229320176487916666402997509188729971690526083222067771600019329260870009579993724077458967773697817571267229951148662959627934791540

a = sqrt(N)+1
x = sqrt(a*a - N)

p = a - x
q = a + x

phi = (p-1)*(q-1)
e = 65537 
d = e.to_bn.mod_inverse(phi)

plaintext = CIPHERTEXT.to_bn.mod_exp(d, N)
plaintext = plaintext.to_s(16)
plaintext = [plaintext].pack("H*").split("\x00")[1]

puts "Plaintext: #{plaintext}"