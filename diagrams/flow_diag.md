# Flowchart Diagrams

<!-- 

%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#BB2528',
      'primaryTextColor': '#fff',
      'primaryBorderColor': '#7C0000',
      'lineColor': '#F8B229',
      'secondaryColor': '#006100',
      'tertiaryColor': '#fff'
    }
  }
}%% 

-->


## PDCCA diagram

```mermaid


%%{
  init: {
  
    'theme': 'base',
    'themeVariables': {
      'primaryColor': 'gray',
      'primaryTextColor': 'white',
      'primaryBorderColor': 'black',
      'lineColor': 'indianred',
      'secondaryColor': 'blue',
      'tertiaryColor': 'Cornsilk',
      'fontSize': '32px'

    }
  }
}%% 



graph TD;

Start(((Start)))  

Start -->  data[Load data] 

Start --> define[Define time windows  scale array]

data --> preproc[Pre-process data] --> generate[Generate integrated series]

preproc --> dcca_pairs[Define dcca pairs array]

generate --> run(Run PDCCA)
dcca_pairs --> run

define --> run 




run --> end_chart(((End)))


subgraph   
    data
    preproc
    generate
    define
    dcca_pairs
end



```

## DMCx² diagrams

```mermaid


%%{
  init: {
  
    'theme': 'base',
    'themeVariables': {
      'primaryColor': 'gray',
      'primaryTextColor': 'white',
      'primaryBorderColor': 'black',
      'lineColor': 'indianred',
      'secondaryColor': 'blue',
      'tertiaryColor': 'Cornsilk',
      'fontSize': '22px'

    }
  }
}%% 



graph TD;

Start(((Start)))  

Start -->  data[Load data] 

Start --> define[Define time windows  scale array]

Start --> def_dmc[Define DMCx² series array]

data --> pre_proc[Pre-process data] --> generate[Generate integrated series]

pre_proc --> dcca_pairs[Define dcca pairs array]

generate --> run(Run DMCx²)
dcca_pairs --> run

define --> run 
def_dmc --> run
run --> end_chart(((End)))


subgraph   
    data
    pre_proc
    generate
    define
    dcca_pairs
    def_dmc
end


```
## DMCx² chart

```mermaid
---
config:
  theme: base
  themeVariables:
    primaryColor: gray
    primaryTextColor: white
    primaryBorderColor: black
    lineColor: Black
    secondaryColor: blue
    tertiaryColor: LightGoldenRodYellow
    fontSize: 25px
  themeCSS: |
    .label {
      text-anchor: start; /* Align text to the left */
    }
    .edgePath path {
      stroke-width: 5px; /* Increase this value to get thicker arrows */
    }
    .edgeLabel {
      font-size: 12px; /* Adjust font size of edge labels if needed */
    }
---


flowchart LR

 subgraph dmc_func["Function: $$~DMC_x^2$$"]
ajust_pdcca_dmc

end
 subgraph data_treatment["Preparation"]
        data["Load data"]
        preproc["Pre-process data"]
        generate["Generate integrated series"]
 end

subgraph ajust_pdcca_dmc
  
    pdcca_func

  run_dmc("$$~~DMC_x^2$$")
  dmc_out[/"Output: $$~~DMC_x^2$$"/]
  dcca_pairs


end


 subgraph pdcca_func["Function:$$~\rho$$ <sub>DCCA</sub>"]

        det["Detrended values"]
        DFA["DFA"]
        dfa[/"Output: DFA"/]
        DCCA["DCCA"]
        dcca[/"Output: DCCA"/]
        p_dcca[/"Output: $$~~\rho$$ <sub>DCCA</sub>"/]
        P_DCCA["$$\rho$$ <sub>DCCA</sub>"]
 end

    Start((("Start"))) --> data
    data --> preproc
    preproc --> generate
    generate --> det
    define_tws["Define time windows scale array"] --> det
    dcca_pairs["Define dcca pairs index 2D array"] -->  DCCA & P_DCCA 
    det --> DFA & DCCA
    DFA --> dfa
    dfa --> P_DCCA
    DCCA --> dcca
    dcca --> P_DCCA
    P_DCCA --> p_dcca
    p_dcca --> run_dmc
    run_dmc --> dmc_out
    def_dmc["Define DMCx² series index 2D array"] --> run_dmc & dcca_pairs
    dmc_out --> end_chart((("End")))
    
%% class definitions
    classDef se_class fill:Orange, margin:120px, font-size:40px
    classDef pad_class margin-botton:1px
    classDef run_class fill:indianred, color:White
    classDef func_class fill:BurlyWood, color:White, margin:0px
    classDef func_dmc_class fill:PaleGoldenRod, color:black
    classDef optional_class fill:Seagreen, color:White
    classDef indirect_class fill:LightGrey, color:Black
    classDef out_class fill:CornflowerBlue
    classDef transparent_class fill:#00000000, color:#00000000, margin-top:200px

%% Class attribution
     dfa:::out_class
     dcca:::out_class
     P_DCCA:::pad_class
     p_dcca:::out_class
     Start:::se_class
     dcca_pairs:::indirect_class
     det:::indirect_class
     DFA:::indirect_class
     DCCA:::indirect_class
     P_DCCA:::indirect_class
     run_dmc:::run_class
     pdcca_func:::func_class
     dmc_out:::out_class
     def_dmc:::optional_class
     end_chart:::se_class
     dmc_func:::func_dmc_class
      ajust_pdcca_dmc:::transparent_class

```

## DMC chart

```mermaid






---
config:
  theme: base
  themeVariables:
    primaryColor: gray
    primaryTextColor: white
    primaryBorderColor: black
    lineColor: Firebrick
    secondaryColor: blue
    tertiaryColor: MintCream
    fontSize: 25px
  
---



flowchart LR;

linkStyle default fill:none, stroke-width:3px,stroke:Firebrick

classDef se_class fill:Orange, padding:100px, font-size:30px;

classDef run_class fill:FireBrick, color:Wite;

classDef optional_class fill:Seagreen, color:Wite;

classDef indirect_class fill:LightGrey, color:Black;

classDef out_class fill:CornflowerBlue;

Start(((Start)))



Start -->  data[Load data]

define_tws[Define time windows  scale array]

data --> preproc[Pre-process data] --> generate[Generate integrated series]

dcca_pairs[Define dcca pairs index 2D array]

generate --> run(Run  $$~\rho$$ <sub> DCCA</sub> )

define_tws --> run
dcca_pairs --> run

 

run --> dfa[/Output: DFA /]

run --> dcca[/Output: DCCA/]

run --> p_dcca[/Output: $$~\rho$$ <sub> DCCA</sub>/]

p_dcca 




class dfa out_class

class dcca out_class

class p_dcca out_class

class out_dmc out_class


class dcca_pairs optional_class




p_dcca  --> end_chart(((End)))

subgraph  Data treatment 
    data
    preproc
    generate

end

class Start se_class
class end_chart se_class
class run run_class


```
## estados




```mermaid
---
config:
  theme: base
  themeVariables:
    primaryColor: gray
    primaryTextColor: white
    primaryBorderColor: black
    lineColor: Firebrick
    secondaryColor: blue
    tertiaryColor: MintCream
    fontSize: 18px
---
flowchart LR
 subgraph subGraph0["series"]
        node_1((("S1")))
        node_2((("S2")))
        node_k((("Sk")))
  end
 subgraph subGraph1["integrated series"]
        node_I1["IS1"]
        node_I2["IS2"]
        node_Ik["ISk"]
  end
 subgraph subGraph2["deternded values"]
        Det_S1["Det S1"]
        Det_S2["Det S2"]
        Det_Sk["Det Sk"]
  end


  subgraph subGraph3["DFA"]

        DFA_S1[/"DFA S1"/]
        DFA_S2[/"DFA S2"/]
        DFA_Sk[/"DFA Sk"/]
  end


  subgraph subGraph4["DCCA"]

        DCCA_S12[/"DCCa 12"/]
        DCCA_S1k[/"DCCa 1k"/]
        DCCA_S2k[/"DCCa 2k"/]
  end


  subgraph subGraph5["PDCCA"]

        PDCCA_S12[/"PDCCa 12"/]
        PDCCA_S1k[/"PDCCa 1k"/]
        PDCCA_S2k[/"PDCCa 2k"/]
  end

  
    node_1 --> node_I1
    node_2 --> node_I2
    node_k --> node_Ik

    node_I1 --> Det_S1
    node_I2 --> Det_S2
    node_Ik --> Det_Sk

    Det_S1 --> DFA_S1
    Det_S2 --> DFA_S2
    Det_Sk --> DFA_Sk

    Det_S1 --> DCCA_S12
    Det_S2 --> DCCA_S12

    Det_S1 --> DCCA_S1k
    Det_Sk --> DCCA_S1k

    Det_S2 --> DCCA_S2k
    Det_Sk --> DCCA_S2k


    DFA_S1 --> PDCCA_S12
    DFA_S2 --> PDCCA_S12
    DCCA_S12 --> PDCCA_S12

    DFA_S1 --> PDCCA_S1k
    DFA_Sk --> PDCCA_S1k
    DCCA_S1k --> PDCCA_S1k

    DFA_S2 --> PDCCA_S2k
    DFA_Sk --> PDCCA_S2k
    DCCA_S2k --> PDCCA_S2k




```