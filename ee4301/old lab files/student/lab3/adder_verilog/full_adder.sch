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
        <signal name="ain" />
        <signal name="bin" />
        <signal name="cin" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="sum" />
        <signal name="cout" />
        <port polarity="Input" name="ain" />
        <port polarity="Input" name="bin" />
        <port polarity="Input" name="cin" />
        <port polarity="Output" name="sum" />
        <port polarity="Output" name="cout" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="xor3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="208" y1="-128" y2="-128" x1="256" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <arc ex="64" ey="-176" sx="64" sy="-80" r="56" cx="32" cy="-128" />
            <arc ex="128" ey="-176" sx="208" sy="-128" r="88" cx="132" cy="-88" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="64" y1="-80" y2="-80" x1="128" />
            <line x2="64" y1="-176" y2="-176" x1="128" />
            <arc ex="208" ey="-128" sx="128" sy="-80" r="88" cx="132" cy="-168" />
        </blockdef>
        <blockdef name="or3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="72" y1="-128" y2="-128" x1="0" />
            <line x2="48" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <arc ex="192" ey="-128" sx="112" sy="-80" r="88" cx="116" cy="-168" />
            <arc ex="48" ey="-176" sx="48" sy="-80" r="56" cx="16" cy="-128" />
            <line x2="48" y1="-64" y2="-80" x1="48" />
            <line x2="48" y1="-192" y2="-176" x1="48" />
            <line x2="48" y1="-80" y2="-80" x1="112" />
            <arc ex="112" ey="-176" sx="192" sy="-128" r="88" cx="116" cy="-88" />
            <line x2="48" y1="-176" y2="-176" x1="112" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="bin" name="I0" />
            <blockpin signalname="ain" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="cin" name="I0" />
            <blockpin signalname="bin" name="I1" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="cin" name="I0" />
            <blockpin signalname="ain" name="I1" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="or3" name="XLXI_6">
            <blockpin signalname="XLXN_3" name="I0" />
            <blockpin signalname="XLXN_2" name="I1" />
            <blockpin signalname="XLXN_1" name="I2" />
            <blockpin signalname="cout" name="O" />
        </block>
        <block symbolname="xor3" name="XLXI_7">
            <blockpin signalname="cin" name="I0" />
            <blockpin signalname="bin" name="I1" />
            <blockpin signalname="ain" name="I2" />
            <blockpin signalname="sum" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1200" y="1456" name="XLXI_1" orien="R0" />
        <instance x="1200" y="1600" name="XLXI_2" orien="R0" />
        <instance x="1200" y="1744" name="XLXI_3" orien="R0" />
        <instance x="1504" y="1248" name="XLXI_7" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1536" y1="1360" y2="1360" x1="1456" />
            <wire x2="1536" y1="1360" y2="1440" x1="1536" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1536" y1="1504" y2="1504" x1="1456" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1536" y1="1648" y2="1648" x1="1456" />
            <wire x2="1536" y1="1568" y2="1648" x1="1536" />
        </branch>
        <branch name="ain">
            <wire x2="1120" y1="1328" y2="1328" x1="1072" />
            <wire x2="1120" y1="1328" y2="1616" x1="1120" />
            <wire x2="1200" y1="1616" y2="1616" x1="1120" />
            <wire x2="1200" y1="1328" y2="1328" x1="1120" />
            <wire x2="1120" y1="1056" y2="1328" x1="1120" />
            <wire x2="1504" y1="1056" y2="1056" x1="1120" />
        </branch>
        <branch name="bin">
            <wire x2="1152" y1="1472" y2="1472" x1="1072" />
            <wire x2="1200" y1="1472" y2="1472" x1="1152" />
            <wire x2="1152" y1="1120" y2="1392" x1="1152" />
            <wire x2="1152" y1="1392" y2="1472" x1="1152" />
            <wire x2="1200" y1="1392" y2="1392" x1="1152" />
            <wire x2="1504" y1="1120" y2="1120" x1="1152" />
        </branch>
        <branch name="cin">
            <wire x2="1184" y1="1680" y2="1680" x1="1072" />
            <wire x2="1200" y1="1680" y2="1680" x1="1184" />
            <wire x2="1184" y1="1184" y2="1536" x1="1184" />
            <wire x2="1184" y1="1536" y2="1680" x1="1184" />
            <wire x2="1200" y1="1536" y2="1536" x1="1184" />
            <wire x2="1504" y1="1184" y2="1184" x1="1184" />
        </branch>
        <instance x="1536" y="1632" name="XLXI_6" orien="R0" />
        <iomarker fontsize="28" x="1072" y="1328" name="ain" orien="R180" />
        <iomarker fontsize="28" x="1072" y="1472" name="bin" orien="R180" />
        <iomarker fontsize="28" x="1072" y="1680" name="cin" orien="R180" />
        <branch name="sum">
            <wire x2="1792" y1="1120" y2="1120" x1="1760" />
        </branch>
        <iomarker fontsize="28" x="1792" y="1120" name="sum" orien="R0" />
        <branch name="cout">
            <wire x2="1824" y1="1504" y2="1504" x1="1792" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1504" name="cout" orien="R0" />
    </sheet>
</drawing>