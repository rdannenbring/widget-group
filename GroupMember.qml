import QtQuick
import qs.Common

// Renders ONE target plugin's real, live bar widget inline, with full bar context
// injected. Because this lives inside the group's bar pill (i.e. in the actual bar
// window), the embedded widget's own popout positions below the bar correctly.
Item {
    id: gm

    property var pluginService: null
    property var popoutService: null
    property string targetId: ""

    // Bar context (forwarded from the group's PluginComponent)
    property var axis: null
    property string section: "center"
    property var parentScreen: null
    property real widgetThickness: 30
    property real barThickness: 40
    property real barSpacing: 4
    property var barConfig: null
    property var blurBarWindow: null

    readonly property var _component: (pluginService && targetId && pluginService.pluginWidgetComponents)
        ? (pluginService.pluginWidgetComponents[targetId] || null)
        : null
    readonly property bool ready: loader.item !== null

    implicitWidth: loader.item ? loader.item.width : 0
    implicitHeight: loader.item ? loader.item.height : 0

    Loader {
        id: loader
        active: gm._component !== null
        sourceComponent: gm._component
        anchors.verticalCenter: parent.verticalCenter

        onLoaded: {
            if (!item)
                return
            try {
                if ("pluginId" in item)      item.pluginId = gm.targetId
                if ("pluginService" in item) item.pluginService = gm.pluginService
                if ("popoutService" in item) item.popoutService = gm.popoutService
                if ("variantId" in item)     item.variantId = ""
            } catch (e) {
                console.warn("[widgetGroup] member injection failed for", gm.targetId, ":", e)
            }
        }
    }

    Binding { target: loader.item; when: loader.item && "axis" in loader.item;            property: "axis";            value: gm.axis;            restoreMode: Binding.RestoreNone }
    Binding { target: loader.item; when: loader.item && "section" in loader.item;         property: "section";         value: gm.section;         restoreMode: Binding.RestoreNone }
    Binding { target: loader.item; when: loader.item && "parentScreen" in loader.item;    property: "parentScreen";    value: gm.parentScreen;    restoreMode: Binding.RestoreNone }
    Binding { target: loader.item; when: loader.item && "widgetThickness" in loader.item; property: "widgetThickness"; value: gm.widgetThickness; restoreMode: Binding.RestoreNone }
    Binding { target: loader.item; when: loader.item && "barThickness" in loader.item;    property: "barThickness";    value: gm.barThickness;    restoreMode: Binding.RestoreNone }
    Binding { target: loader.item; when: loader.item && "barSpacing" in loader.item;      property: "barSpacing";      value: gm.barSpacing;      restoreMode: Binding.RestoreNone }
    Binding { target: loader.item; when: loader.item && "barConfig" in loader.item;       property: "barConfig";       value: gm.barConfig;       restoreMode: Binding.RestoreNone }
    Binding { target: loader.item; when: loader.item && "blurBarWindow" in loader.item;   property: "blurBarWindow";   value: gm.blurBarWindow;   restoreMode: Binding.RestoreNone }
}
