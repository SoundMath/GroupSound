# File: gap2uacalc.g
# Author: William DeMeo
# Date: 2011.06.06
# Updated: 2011.10.24
# Updated: 2012.09.24
#
# Description: GAP routines for creating a uacalc algebra file from GAP groups.
#
# Send questions, comments, suggestions to williamdemeo@gmail.com
#

gset2uacalc:=function(args)
    # gset2uacalc:=function([G, algebraname])
    # Convert a gap action group to a uacalc algebra file.
    #    
    # Input: G            The action group created in GAP, 
    #                     for example, like this:
    #                     G := Action( K, RightCosets(K,H), OnRight );
    #
    #        algebraname  (optional, default=StructureDescription(G)) 
    #                     A string which will serve as both the name of 
    #                     the algebra in uacalc, and also the filename 
    #                     (the .ua suffix will be added).
    #
    # Output: algebraname.ua   A uacalc file containing a description of the gset
    #                          as an algebra suitable for loading into the ua calculator.
    #
    # Examples:
    #         1.     gap> G := SymmetricGroup(3);;
    #                gap> act:=Action(G,G,OnRight);;
    #                gap> gset2uacalc([act, "S3action"]);;
    #
    #         2.     gap> G := TransitiveGroup(8,4);;
    #                gap> gset2uacalc([G, "D8"]);
    #    
    #         3.     gap> G:=SmallGroup(24,13);; # C2 x A4                                 
    #                gap> ccsg:=ConjugacyClassesSubgroups(G);;                   
    #                gap> H:=Representative(ccsg[2]);;        
    #                gap> act:=Action(G,RightCosets(G,H),OnRight);;
    #                gap> gset2uacalc([act, "C2xA4modC2"]);
    #
    #         4.     The last example could also be accomplished in just two lines:
    #                gap> G := TransitiveGroup(12,7);
    #                gap> gset2uacalc([G, "C2xA4mod2"]);
    
    local nargin, G, algebraname, filename, outfile, N, opcount, g, x;
    G:=args[1]; 
    
    # # Not sure why we required transitivity before.
    # if not IsTransitive(G) then
    #     Error("Usage: gset2uacalc([G, ... ]); G must be a transitive group.");
    # fi;
    
    nargin := Length(args);
    if nargin < 2 then 
        algebraname:=StructureDescription(G); 
    else 
        algebraname:=args[2]; 
    fi;
    
    filename := Concatenation(algebraname, ".ua");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    Print("uacalc file: ", filename, "\n");

    N:=NrMovedPoints(G);
    
    PrintTo(outfile, "<?xml version=\"1.0\"?>\n");
    AppendTo(outfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
    AppendTo(outfile, "<desc>The permutational algebra (", MovedPoints(G)-1, ", ", StructureDescription(G), ").</desc>\n");
    AppendTo(outfile, "<cardinality>", N, "</cardinality>\n");
    AppendTo(outfile, "<operations>\n");
    opcount:=0;
    
    for g in GeneratorsOfGroup(G) do
        AppendTo(outfile, "<op>\n<opSymbol><opName>g", opcount, "</opName>\n");
        AppendTo(outfile, "<arity>1</arity>\n</opSymbol>\n<opTable>\n<intArray>\n<row>");
        AppendTo(outfile, 1^g-1);
        for x in [2..N] do
            AppendTo(outfile, ",", x^g-1);
        od;
        AppendTo(outfile, "</row>\n</intArray>\n</opTable>\n</op>\n");
        opcount:=opcount+1;
    od;
    AppendTo(outfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
end;


group2uacalc:=function(args)
    # group2uacalc:=function([G, algebraname])
    # Convert a group to a uacalc algebra file.
    #    
    # Input: G                 A group created in GAP.
    #
    #        algebraname       (optional, default=StructureDescription(G)) 
    #                          A string which will serve as both the name of 
    #                          the algebra in uacalc, and also the filename 
    #                          (the .ua suffix will be added).
    #
    # Output: algebraname.ua   A uacalc file containing a description of the group 
    #                          as an algebra suitable for loading into the ua calculator.
    #
    # Examples:
    #         1.    gap> G := SymmetricGroup(5);
    #               gap> group2uacalc([G, "S5"]);
    #
    #         2.    gap> G := SmallGroup(60,5);
    #               gap> group2uacalc([G, "A5"]);
    #
    # Notes: If you want the output to display more group elements in the description of 
    #        the algebra please increase the variable MAXDISP below.
    
    local nargin, G, algebraname, filename, outfile, N, g, f, h, x, elements, pos, i, j, MAXDISP;
    G:=args[1]; 
    MAXDISP:=16;
    nargin := Length(args);
    if nargin < 2 then 
        algebraname:=StructureDescription(G); 
    else 
        algebraname:=args[2]; 
    fi;
    
    filename := Concatenation(algebraname, ".ua");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    Print("uacalc file: ", filename, "\n");

    N:=Order(G);
    elements:=Elements(G);
    PrintTo(outfile, "<?xml version=\"1.0\"?>\n");
    AppendTo(outfile, "<algebra>\n<basicAlgebra>\n<algName>", algebraname, "</algName>\n");
    AppendTo(outfile, "<desc>", StructureDescription(G), ". ");
    MAXDISP:=Minimum(MAXDISP,N);
    AppendTo(outfile, "0 = id, ");
    for i in [2..MAXDISP-1] do
        g:=elements[i];
        AppendTo(outfile, i-1, " = ", g, ", ");
    od;
    AppendTo(outfile, MAXDISP-1, " = ", elements[MAXDISP]);
    if MAXDISP = N then
        AppendTo(outfile, ".</desc>\n");
    else 
        AppendTo(outfile, "...</desc>\n");
    fi;
    AppendTo(outfile, "<cardinality>", N, "</cardinality>\n");
    AppendTo(outfile, "<operations>\n");
    AppendTo(outfile, "<op>\n<opSymbol><opName>p</opName>\n");
    AppendTo(outfile, "<arity>2</arity>\n</opSymbol>\n<opTable>\n<intArray>\n");
    for i in [1..N] do
        g:=elements[i];
        AppendTo(outfile, "<row r=\"[", i-1, "]\">");
                for j in [1..N] do
            h:=elements[j];
            f:=g*h;
            pos:=Position(elements, f);
            AppendTo(outfile, pos-1, ",");
        od;
        AppendTo(outfile, "</row>\n");
    od;
    AppendTo(outfile, "</intArray>\n</opTable>\n</op>\n");
    AppendTo(outfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
end;


groups2uacalc:=function(N)
    # groups2uacalc:=function(N)
    # This writes all groups of order N to a uacalc file.
    #    
    # Output: GroupsOfOrderN.ua   A uacalc file containing a description of the groups of order N
    #                             as an algebra suitable for loading into the ua calculator.
    #
    local nargin, G, algebraname, filename, outfile, g, f, h, x, elements, pos, i, j, k, MAXDISP;
    MAXDISP:=16;
    
    filename := Concatenation("GroupsOfOrder", String(N), ".ua");
    outfile := OutputTextFile(filename, false);
    SetPrintFormattingStatus(outfile, false);   # This prevents automatic indentation and line breaks.
    
    Print("uacalc file: ", filename, "\n");

    PrintTo(outfile, "<?xml version=\"1.0\"?>\n");
    AppendTo(outfile, "<algebraList>\n");
    for k in [1..NumberSmallGroups(N)] do
        G:=SmallGroup(N,k);
        elements:=Elements(G);
        AppendTo(outfile, "<algebra>\n<basicAlgebra>\n<algName>", StructureDescription(G), "</algName>\n");
        AppendTo(outfile, "<desc>", StructureDescription(G), ". ");
        MAXDISP:=Minimum(MAXDISP,N);
        AppendTo(outfile, "0 = id, ");
        for i in [2..MAXDISP-1] do
            g:=elements[i];
            AppendTo(outfile, i-1, " = ", g, ", ");
        od;
        AppendTo(outfile, MAXDISP-1, " = ", elements[MAXDISP]);
        if MAXDISP = N then
            AppendTo(outfile, ".</desc>\n");
        else 
            AppendTo(outfile, "...</desc>\n");
        fi;
        AppendTo(outfile, "<cardinality>", N, "</cardinality>\n");
        AppendTo(outfile, "<operations>\n");
        AppendTo(outfile, "<op>\n<opSymbol><opName>p</opName>\n");
        AppendTo(outfile, "<arity>2</arity>\n</opSymbol>\n<opTable>\n<intArray>\n");
        for i in [1..N] do
            g:=elements[i];
            AppendTo(outfile, "<row r=\"[", i-1, "]\">");
                    for j in [1..N] do
                h:=elements[j];
                f:=g*h;
                pos:=Position(elements, f);
                AppendTo(outfile, pos-1, ",");
            od;
            AppendTo(outfile, "</row>\n");
        od;
        AppendTo(outfile, "</intArray>\n</opTable>\n</op>\n");
        AppendTo(outfile, "</operations>\n</basicAlgebra>\n</algebra>\n");
    od;
    AppendTo(outfile, "</algebraList>\n");
end;
      
