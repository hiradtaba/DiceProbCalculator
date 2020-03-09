prompt1 = ('please enter the number of dice (must be a positive integer): ');
errorprompt = ('invalid input! please enter a positive integer: ');
N = input(prompt1);
while (N<=0)
    N = input(errorprompt);
end

prompt2 = ('please enter the number of sides on each dice (must be a positive integer): ');
Q = input(prompt2);
while(Q<=0)
    Q = input(errorprompt);
end

a = [N:Q*N];
con = ((Q-1)*N)+1;
b = zeros(1,con);
x = Q^N;
fun = 0;
syms w

for m = 1:Q
    fun = fun + w^m;
end

expfun = expand(fun^N);
D = coeffs(expfun);

for i = 1:con
    b(i) = D(i);
end

prob = b ./ x;

p = max(prob);
[~,I] = find(prob==p);

Sums = a'; % creating the transpose of the sums array
Frequency = b'; % creating the transpose of the frequency array
Probabilities = prob'; % creating the transpose of the probabilities array

output = table(Sums,Frequency,Probabilities) % creating a table containing the sums, the frequencies
% and the probabilities values

if (length(I)==1)
   " The sum with the highest probability is: "+a(I)+" " 
end

if(length(I)==2)
    " The sums with the highest probability are: "+a(I(1))+" and "+a(I(2))+" "
end

