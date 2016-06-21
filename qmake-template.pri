# qmake template project include file

isEmpty(TEMPLATE_PRI_IS_USED) {
	TEMPLATE_PRI_IS_USED = true
} else {
	error(qmake-template.pri included more than once. Check your .pro file)
}

CONFIG      += debug_and_release

CONFIG += silent
win32: CONFIG += console

BIN_PATH = $$PWD/../bin

contains( TEMPLATE, app ) {
	DESTDIR = $$BIN_PATH	
}

# link fix
#contains( CONFIG, staticlib ) {
#	QMAKE_LFLAGS += -static
# 	win32:QMAKE_LFLAGS += -static-libgcc
#	}

CONFIG(debug, debug|release) {
	DEBUG_SUFFIX = .debug
	!contains( TARGET, $$DEBUG_SUFFIX ) {
		TARGET = $$join(TARGET,,,$$DEBUG_SUFFIX)
		TARGET_SUFFIX = $$DEBUG_SUFFIX
	}
}

BUILDPATH   = $$PWD/../build/$$TARGET

ROOT = $$PWD
OBJECTS_DIR = $$BUILDPATH/obj
RCC_DIR     = $$BUILDPATH/rcc
MOC_DIR     = $$BUILDPATH/moc
#UI_DIR      = $$BUILDPATH/ui