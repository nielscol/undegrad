<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="a(0)">
        </signal>
        <signal name="a(1)">
        </signal>
        <signal name="a(2)">
        </signal>
        <signal name="a(3)">
        </signal>
        <signal name="b(0)">
        </signal>
        <signal name="b(1)">
        </signal>
        <signal name="b(2)">
        </signal>
        <signal name="b(3:0)" />
        <signal name="sub" />
        <signal name="s(0)">
        </signal>
        <signal name="s(1)">
        </signal>
        <signal name="s(2)">
        </signal>
        <signal name="s(3)">
        </signal>
        <signal name="cout" />
        <signal name="a(3:0)" />
        <signal name="s(3:0)" />
        <signal name="XLXN_67" />
        <signal name="XLXN_68" />
        <signal name="XLXN_69" />
        <signal name="XLXN_70" />
        <signal name="b(3)" />
        <port polarity="Input" name="b(3:0)" />
        <port polarity="Input" name="sub" />
        <port polarity="Output" name="cout" />
        <port polarity="Input" name="a(3:0)" />
        <port polarity="Output" name="s(3:0)" />
        <blockdef name="full_adder">
            <timestamp>2015-9-25T18:31:54</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="full_adder" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="ain" />
            <blockpin signalname="XLXN_14" name="bin" />
            <blockpin signalname="XLXN_5" name="cin" />
            <blockpin signalname="XLXN_18" name="cout" />
            <blockpin signalname="XLXN_21" name="sum" />
        </block>
        <block symbolname="full_adder" name="XLXI_2">
            <blockpin signalname="XLXN_2" name="ain" />
            <blockpin signalname="XLXN_15" name="bin" />
            <blockpin signalname="XLXN_18" name="cin" />
            <blockpin signalname="XLXN_19" name="cout" />
            <blockpin signalname="XLXN_22" name="sum" />
        </block>
        <block symbolname="full_adder" name="XLXI_4">
            <blockpin signalname="XLXN_4" name="ain" />
            <blockpin signalname="XLXN_17" name="bin" />
            <blockpin signalname="XLXN_20" name="cin" />
            <blockpin signalname="XLXN_25" name="cout" />
            <blockpin signalname="XLXN_24" name="sum" />
        </block>
        <block symbolname="full_adder" name="XLXI_3">
            <blockpin signalname="XLXN_3" name="ain" />
            <blockpin signalname="XLXN_16" name="bin" />
            <blockpin signalname="XLXN_19" name="cin" />
            <blockpin signalname="XLXN_20" name="cout" />
            <blockpin signalname="XLXN_23" name="sum" />
        </block>
        <block symbolname="buf" name="XLXI_26">
            <blockpin signalname="XLXN_25" name="I" />
            <blockpin signalname="cout" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_9">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_10">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_11">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_12" name="I1" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_12">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_13" name="I1" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_13">
            <blockpin signalname="a(0)" name="I" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_14">
            <blockpin signalname="a(1)" name="I" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="a(2)" name="I" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_16">
            <blockpin signalname="a(3)" name="I" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_21">
            <blockpin signalname="sub" name="I" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="b(0)" name="I" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_18">
            <blockpin signalname="b(1)" name="I" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_19">
            <blockpin signalname="b(2)" name="I" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_20">
            <blockpin signalname="b(3)" name="I" />
            <blockpin signalname="XLXN_17" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_22">
            <blockpin signalname="XLXN_21" name="I" />
            <blockpin signalname="s(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_23">
            <blockpin signalname="XLXN_22" name="I" />
            <blockpin signalname="s(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_24">
            <blockpin signalname="XLXN_23" name="I" />
            <blockpin signalname="s(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_25">
            <blockpin signalname="XLXN_24" name="I" />
            <blockpin signalname="s(3)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1808" y="1040" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1808" y="1328" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1808" y="1920" name="XLXI_4" orien="R0">
        </instance>
        <instance x="1808" y="1616" name="XLXI_3" orien="R0">
        </instance>
        <instance x="2624" y="1712" name="XLXI_26" orien="R0" />
        <instance x="1392" y="976" name="XLXI_9" orien="R0" />
        <instance x="1392" y="1264" name="XLXI_10" orien="R0" />
        <instance x="1392" y="1552" name="XLXI_11" orien="R0" />
        <instance x="1392" y="1856" name="XLXI_12" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1808" y1="880" y2="880" x1="1648" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1808" y1="1168" y2="1168" x1="1648" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1808" y1="1456" y2="1456" x1="1648" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1808" y1="1760" y2="1760" x1="1648" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1344" y1="1792" y2="1792" x1="768" />
            <wire x2="1392" y1="1792" y2="1792" x1="1344" />
            <wire x2="1344" y1="912" y2="1008" x1="1344" />
            <wire x2="1808" y1="1008" y2="1008" x1="1344" />
            <wire x2="1344" y1="1008" y2="1200" x1="1344" />
            <wire x2="1392" y1="1200" y2="1200" x1="1344" />
            <wire x2="1344" y1="1200" y2="1488" x1="1344" />
            <wire x2="1392" y1="1488" y2="1488" x1="1344" />
            <wire x2="1344" y1="1488" y2="1792" x1="1344" />
            <wire x2="1392" y1="912" y2="912" x1="1344" />
        </branch>
        <instance x="544" y="880" name="XLXI_13" orien="R0" />
        <instance x="544" y="944" name="XLXI_14" orien="R0" />
        <instance x="544" y="1008" name="XLXI_15" orien="R0" />
        <instance x="544" y="1072" name="XLXI_16" orien="R0" />
        <branch name="XLXN_10">
            <wire x2="1392" y1="848" y2="848" x1="768" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1072" y1="912" y2="912" x1="768" />
            <wire x2="1072" y1="912" y2="1136" x1="1072" />
            <wire x2="1392" y1="1136" y2="1136" x1="1072" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1056" y1="976" y2="976" x1="768" />
            <wire x2="1056" y1="976" y2="1424" x1="1056" />
            <wire x2="1392" y1="1424" y2="1424" x1="1056" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1040" y1="1040" y2="1040" x1="768" />
            <wire x2="1040" y1="1040" y2="1728" x1="1040" />
            <wire x2="1392" y1="1728" y2="1728" x1="1040" />
        </branch>
        <instance x="544" y="1824" name="XLXI_21" orien="R0" />
        <instance x="544" y="1200" name="XLXI_17" orien="R0" />
        <instance x="544" y="1264" name="XLXI_18" orien="R0" />
        <instance x="544" y="1328" name="XLXI_19" orien="R0" />
        <instance x="544" y="1392" name="XLXI_20" orien="R0" />
        <branch name="XLXN_14">
            <wire x2="1280" y1="1168" y2="1168" x1="768" />
            <wire x2="1280" y1="944" y2="1168" x1="1280" />
            <wire x2="1808" y1="944" y2="944" x1="1280" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1808" y1="1232" y2="1232" x1="768" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1280" y1="1296" y2="1296" x1="768" />
            <wire x2="1280" y1="1296" y2="1520" x1="1280" />
            <wire x2="1808" y1="1520" y2="1520" x1="1280" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1264" y1="1360" y2="1360" x1="768" />
            <wire x2="1264" y1="1360" y2="1824" x1="1264" />
            <wire x2="1808" y1="1824" y2="1824" x1="1264" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="1744" y1="1056" y2="1296" x1="1744" />
            <wire x2="1808" y1="1296" y2="1296" x1="1744" />
            <wire x2="2272" y1="1056" y2="1056" x1="1744" />
            <wire x2="2272" y1="944" y2="944" x1="2192" />
            <wire x2="2272" y1="944" y2="1056" x1="2272" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="2272" y1="1344" y2="1344" x1="1744" />
            <wire x2="1744" y1="1344" y2="1584" x1="1744" />
            <wire x2="1808" y1="1584" y2="1584" x1="1744" />
            <wire x2="2272" y1="1232" y2="1232" x1="2192" />
            <wire x2="2272" y1="1232" y2="1344" x1="2272" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="2256" y1="1648" y2="1648" x1="1728" />
            <wire x2="1728" y1="1648" y2="1888" x1="1728" />
            <wire x2="1808" y1="1888" y2="1888" x1="1728" />
            <wire x2="2256" y1="1520" y2="1520" x1="2192" />
            <wire x2="2256" y1="1520" y2="1648" x1="2256" />
        </branch>
        <instance x="2640" y="912" name="XLXI_22" orien="R0" />
        <instance x="2640" y="976" name="XLXI_23" orien="R0" />
        <instance x="2640" y="1040" name="XLXI_24" orien="R0" />
        <instance x="2640" y="1104" name="XLXI_25" orien="R0" />
        <branch name="XLXN_21">
            <wire x2="2640" y1="880" y2="880" x1="2192" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="2416" y1="1168" y2="1168" x1="2192" />
            <wire x2="2416" y1="944" y2="1168" x1="2416" />
            <wire x2="2640" y1="944" y2="944" x1="2416" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="2432" y1="1456" y2="1456" x1="2192" />
            <wire x2="2432" y1="1008" y2="1456" x1="2432" />
            <wire x2="2640" y1="1008" y2="1008" x1="2432" />
        </branch>
        <branch name="XLXN_24">
            <wire x2="2448" y1="1760" y2="1760" x1="2192" />
            <wire x2="2448" y1="1072" y2="1760" x1="2448" />
            <wire x2="2640" y1="1072" y2="1072" x1="2448" />
        </branch>
        <branch name="XLXN_25">
            <wire x2="2464" y1="1824" y2="1824" x1="2192" />
            <wire x2="2464" y1="1680" y2="1824" x1="2464" />
            <wire x2="2624" y1="1680" y2="1680" x1="2464" />
        </branch>
        <branch name="a(0)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="480" y="848" type="branch" />
            <wire x2="528" y1="816" y2="816" x1="368" />
            <wire x2="528" y1="816" y2="848" x1="528" />
            <wire x2="544" y1="848" y2="848" x1="528" />
            <wire x2="528" y1="848" y2="848" x1="480" />
        </branch>
        <branch name="a(1)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="480" y="912" type="branch" />
            <wire x2="528" y1="880" y2="880" x1="368" />
            <wire x2="528" y1="880" y2="928" x1="528" />
            <wire x2="528" y1="912" y2="912" x1="480" />
            <wire x2="544" y1="912" y2="912" x1="528" />
            <wire x2="528" y1="912" y2="928" x1="528" />
        </branch>
        <branch name="a(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="480" y="976" type="branch" />
            <wire x2="528" y1="944" y2="944" x1="368" />
            <wire x2="528" y1="944" y2="976" x1="528" />
            <wire x2="544" y1="976" y2="976" x1="528" />
            <wire x2="528" y1="976" y2="976" x1="480" />
        </branch>
        <branch name="a(3)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="480" y="1040" type="branch" />
            <wire x2="528" y1="1008" y2="1008" x1="368" />
            <wire x2="528" y1="1008" y2="1040" x1="528" />
            <wire x2="544" y1="1040" y2="1040" x1="528" />
            <wire x2="528" y1="1040" y2="1040" x1="480" />
        </branch>
        <branch name="b(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="512" y="1168" type="branch" />
            <wire x2="512" y1="1168" y2="1168" x1="368" />
            <wire x2="544" y1="1168" y2="1168" x1="512" />
        </branch>
        <branch name="b(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="512" y="1232" type="branch" />
            <wire x2="512" y1="1232" y2="1232" x1="368" />
            <wire x2="544" y1="1232" y2="1232" x1="512" />
        </branch>
        <branch name="b(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="512" y="1296" type="branch" />
            <wire x2="512" y1="1296" y2="1296" x1="368" />
            <wire x2="544" y1="1296" y2="1296" x1="512" />
        </branch>
        <branch name="sub">
            <wire x2="544" y1="1792" y2="1792" x1="512" />
        </branch>
        <branch name="s(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2896" y="880" type="branch" />
            <wire x2="2896" y1="880" y2="880" x1="2864" />
            <wire x2="3072" y1="880" y2="880" x1="2896" />
        </branch>
        <branch name="s(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2896" y="944" type="branch" />
            <wire x2="2896" y1="944" y2="944" x1="2864" />
            <wire x2="3072" y1="944" y2="944" x1="2896" />
        </branch>
        <branch name="s(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2896" y="1008" type="branch" />
            <wire x2="2896" y1="1008" y2="1008" x1="2864" />
            <wire x2="3072" y1="1008" y2="1008" x1="2896" />
        </branch>
        <branch name="s(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2896" y="1072" type="branch" />
            <wire x2="2896" y1="1072" y2="1072" x1="2864" />
            <wire x2="3072" y1="1072" y2="1072" x1="2896" />
        </branch>
        <branch name="cout">
            <wire x2="2880" y1="1680" y2="1680" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="512" y="1792" name="sub" orien="R180" />
        <iomarker fontsize="28" x="2880" y="1680" name="cout" orien="R0" />
        <branch name="a(3:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="208" y="928" type="branch" />
            <wire x2="208" y1="928" y2="928" x1="144" />
            <wire x2="272" y1="928" y2="928" x1="208" />
            <wire x2="272" y1="928" y2="944" x1="272" />
            <wire x2="272" y1="944" y2="1008" x1="272" />
            <wire x2="272" y1="1008" y2="1072" x1="272" />
            <wire x2="272" y1="784" y2="816" x1="272" />
            <wire x2="272" y1="816" y2="880" x1="272" />
            <wire x2="272" y1="880" y2="928" x1="272" />
        </branch>
        <branch name="b(3:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="224" y="1248" type="branch" />
            <wire x2="224" y1="1248" y2="1248" x1="144" />
            <wire x2="272" y1="1248" y2="1248" x1="224" />
            <wire x2="272" y1="1248" y2="1296" x1="272" />
            <wire x2="272" y1="1296" y2="1344" x1="272" />
            <wire x2="272" y1="1344" y2="1360" x1="272" />
            <wire x2="272" y1="1360" y2="1408" x1="272" />
            <wire x2="272" y1="1120" y2="1168" x1="272" />
            <wire x2="272" y1="1168" y2="1232" x1="272" />
            <wire x2="272" y1="1232" y2="1248" x1="272" />
        </branch>
        <branch name="s(3:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3248" y="992" type="branch" />
            <wire x2="3168" y1="816" y2="880" x1="3168" />
            <wire x2="3168" y1="880" y2="944" x1="3168" />
            <wire x2="3168" y1="944" y2="992" x1="3168" />
            <wire x2="3248" y1="992" y2="992" x1="3168" />
            <wire x2="3328" y1="992" y2="992" x1="3248" />
            <wire x2="3168" y1="992" y2="1008" x1="3168" />
            <wire x2="3168" y1="1008" y2="1072" x1="3168" />
            <wire x2="3168" y1="1072" y2="1120" x1="3168" />
        </branch>
        <bustap x2="368" y1="816" y2="816" x1="272" />
        <bustap x2="368" y1="880" y2="880" x1="272" />
        <bustap x2="368" y1="944" y2="944" x1="272" />
        <bustap x2="368" y1="1008" y2="1008" x1="272" />
        <bustap x2="368" y1="1168" y2="1168" x1="272" />
        <bustap x2="368" y1="1232" y2="1232" x1="272" />
        <bustap x2="368" y1="1296" y2="1296" x1="272" />
        <iomarker fontsize="28" x="144" y="928" name="a(3:0)" orien="R180" />
        <iomarker fontsize="28" x="144" y="1248" name="b(3:0)" orien="R180" />
        <bustap x2="3072" y1="880" y2="880" x1="3168" />
        <bustap x2="3072" y1="944" y2="944" x1="3168" />
        <bustap x2="3072" y1="1008" y2="1008" x1="3168" />
        <bustap x2="3072" y1="1072" y2="1072" x1="3168" />
        <iomarker fontsize="28" x="3328" y="992" name="s(3:0)" orien="R0" />
        <bustap x2="368" y1="1344" y2="1344" x1="272" />
        <branch name="b(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="480" y="1360" type="branch" />
            <wire x2="448" y1="1344" y2="1344" x1="368" />
            <wire x2="448" y1="1344" y2="1360" x1="448" />
            <wire x2="464" y1="1360" y2="1360" x1="448" />
            <wire x2="480" y1="1360" y2="1360" x1="464" />
            <wire x2="544" y1="1360" y2="1360" x1="480" />
        </branch>
    </sheet>
</drawing>