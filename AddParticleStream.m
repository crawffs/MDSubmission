function [ output_args ] = AddParticleStream(num, x0, y0, PartAng, Type, Ep, Seper, I)
global AtomSpacing x y AtomType Vx Vy Mass0 Mass1 nAtoms

V1 = zeros(size(5));


if I == 1
    Mass_1 = Mass1;
    Mass_0 = Mass0;
end

if Type == 0
    Mass = Mass0;
else
    Mass = Mass1;
end

for p = 0:num - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * cos(PartAng);
    y(nAtoms) = y0 * AtomSpacing - Seper * p * AtomSpacing * sin(PartAng);
    AtomType(nAtoms) = Type;
end

if I == 1
    i = 0;
    for p = 0:num - 1
        if i == 0
            V1(p) = sqrt(2 * Ep / Mass_0);
            i = i +1;
        end
        if i == 1
           V1(p) = sqrt(2 * Ep / Mass_1);
           i = i - 1;
        end
    end
end

V_O = sqrt(2 * Ep / Mass);

if I == 1
    for p = 1:num
    Vx(nAtoms - 5 + p) = V1(p) * cos(PartAng);
    Vy(nAtoms - 5 + p) = V1(p) * sin(PartAng);
    end

for p = 1:num
    Vx(nAtoms - 5 + p) = V_O * cos(PartAng);
    Vy(nAtoms - 5 + p) = V_O * sin(PartAng);
end

end
