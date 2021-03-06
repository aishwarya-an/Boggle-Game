MAKEFILE      = Makefile

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_NO_DEBUG -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB
CFLAGS        = -m64 -pipe -O2 -Wall -W -D_REENTRANT -fPIE $(DEFINES)
CXXFLAGS      = -m64 -pipe -O2 -Wall -W -D_REENTRANT -fPIE $(DEFINES)
INCPATH       = -I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++-64 -I. -I/usr/include/qt5 -I/usr/include/qt5/QtWidgets -I/usr/include/qt5/QtGui -I/usr/include/qt5/QtCore -I. -I.
LINK          = g++
LFLAGS        = -m64 -Wl,-O1
LIBS          = $(SUBLIBS) -L/usr/X11R6/lib64 -lQt5Widgets -L/usr/lib/x86_64-linux-gnu -lQt5Gui -lQt5Core -lGL -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /usr/lib/x86_64-linux-gnu/qt5/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = cp -f
COPY_DIR      = cp -f -R
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = main.cpp \
		bogglesolver.cpp \
		Boggle.cpp \
		Board.cpp \
		Trie.cpp moc_bogglesolver.cpp
OBJECTS       = main.o \
		bogglesolver.o \
		Boggle.o \
		Board.o \
		Trie.o \
		moc_bogglesolver.o
DIST          = /usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/spec_pre.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/shell-unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/linux.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/gcc-base.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/g++-base.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/g++-unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/qconfig.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_platformsupport_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_qml.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_qmltest.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_quick.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt_functions.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt_config.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++-64/qmake.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/spec_post.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/default_pre.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/resolve_config.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/default_post.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/warn_on.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/resources.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/moc.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/opengl.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/uic.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/thread.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/testcase_targets.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/exceptions.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/yacc.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/lex.prf \
		GameOfBoggle.pro \
		GameOfBoggle.pro
QMAKE_TARGET  = Game
DESTDIR       = #avoid trailing-slash linebreak
TARGET        = Game


app: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET): ui_bogglesolver.h $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: GameOfBoggle.pro /usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++-64/qmake.conf /usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/spec_pre.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/shell-unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/linux.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/gcc-base.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/g++-base.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/g++-unix.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/qconfig.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_platformsupport_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_qml.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_qmltest.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_quick.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt_functions.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt_config.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++-64/qmake.conf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/spec_post.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/default_pre.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/resolve_config.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/default_post.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/warn_on.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/resources.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/moc.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/opengl.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/uic.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/thread.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/testcase_targets.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/exceptions.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/yacc.prf \
		/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/lex.prf \
		GameOfBoggle.pro \
		/usr/lib/x86_64-linux-gnu/libQt5Widgets.prl \
		/usr/lib/x86_64-linux-gnu/libQt5Gui.prl \
		/usr/lib/x86_64-linux-gnu/libQt5Core.prl
	$(QMAKE) -o Makefile GameOfBoggle.pro
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/spec_pre.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/shell-unix.conf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/unix.conf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/linux.conf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/gcc-base.conf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/gcc-base-unix.conf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/g++-base.conf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/common/g++-unix.conf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/qconfig.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_bootstrap_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_concurrent_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_core.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_core_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_dbus_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_gui.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_gui_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_network.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_network_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_opengl_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_platformsupport_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_printsupport_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_qml.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_qmltest.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_quick.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_sql.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_sql_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_testlib_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_widgets_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xml.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/modules/qt_lib_xml_private.pri:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt_functions.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt_config.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++-64/qmake.conf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/spec_post.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/exclusive_builds.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/default_pre.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/resolve_config.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/default_post.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/gdb_dwarf_index.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/warn_on.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/qt.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/resources.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/moc.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/opengl.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/uic.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/unix/thread.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/testcase_targets.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/exceptions.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/yacc.prf:
/usr/lib/x86_64-linux-gnu/qt5/mkspecs/features/lex.prf:
GameOfBoggle.pro:
/usr/lib/x86_64-linux-gnu/libQt5Widgets.prl:
/usr/lib/x86_64-linux-gnu/libQt5Gui.prl:
/usr/lib/x86_64-linux-gnu/libQt5Core.prl:
qmake: FORCE
	@$(QMAKE) -o Makefile GameOfBoggle.pro

qmake_all: FORCE

dist: 
	@test -d .tmp/Game1.0.0 || mkdir -p .tmp/Game1.0.0
	$(COPY_FILE) --parents $(SOURCES) $(DIST) .tmp/Game1.0.0/ && $(COPY_FILE) --parents bogglesolver.h Boggle.h Board.h Trie.h .tmp/Game1.0.0/ && $(COPY_FILE) --parents main.cpp bogglesolver.cpp Boggle.cpp Board.cpp Trie.cpp .tmp/Game1.0.0/ && $(COPY_FILE) --parents bogglesolver.ui .tmp/Game1.0.0/ && (cd `dirname .tmp/Game1.0.0` && $(TAR) Game1.0.0.tar Game1.0.0 && $(COMPRESS) Game1.0.0.tar) && $(MOVE) `dirname .tmp/Game1.0.0`/Game1.0.0.tar.gz . && $(DEL_FILE) -r .tmp/Game1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core
	-$(DEL_FILE) Game


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

check: first

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_moc_header_make_all: moc_bogglesolver.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_bogglesolver.cpp
moc_bogglesolver.cpp: Boggle.h \
		Trie.h \
		Board.h \
		/usr/include/qt5/QtWidgets/QMainWindow \
		/usr/include/qt5/QtWidgets/qmainwindow.h \
		/usr/include/qt5/QtWidgets/qwidget.h \
		/usr/include/qt5/QtGui/qwindowdefs.h \
		/usr/include/qt5/QtCore/qglobal.h \
		/usr/include/qt5/QtCore/qconfig.h \
		/usr/include/qt5/QtCore/qfeatures.h \
		/usr/include/qt5/QtCore/qsystemdetection.h \
		/usr/include/qt5/QtCore/qprocessordetection.h \
		/usr/include/qt5/QtCore/qcompilerdetection.h \
		/usr/include/qt5/QtCore/qglobalstatic.h \
		/usr/include/qt5/QtCore/qatomic.h \
		/usr/include/qt5/QtCore/qbasicatomic.h \
		/usr/include/qt5/QtCore/qatomic_bootstrap.h \
		/usr/include/qt5/QtCore/qgenericatomic.h \
		/usr/include/qt5/QtCore/qatomic_msvc.h \
		/usr/include/qt5/QtCore/qatomic_integrity.h \
		/usr/include/qt5/QtCore/qoldbasicatomic.h \
		/usr/include/qt5/QtCore/qatomic_vxworks.h \
		/usr/include/qt5/QtCore/qatomic_power.h \
		/usr/include/qt5/QtCore/qatomic_alpha.h \
		/usr/include/qt5/QtCore/qatomic_armv7.h \
		/usr/include/qt5/QtCore/qatomic_armv6.h \
		/usr/include/qt5/QtCore/qatomic_armv5.h \
		/usr/include/qt5/QtCore/qatomic_bfin.h \
		/usr/include/qt5/QtCore/qatomic_ia64.h \
		/usr/include/qt5/QtCore/qatomic_mips.h \
		/usr/include/qt5/QtCore/qatomic_s390.h \
		/usr/include/qt5/QtCore/qatomic_sh4a.h \
		/usr/include/qt5/QtCore/qatomic_sparc.h \
		/usr/include/qt5/QtCore/qatomic_gcc.h \
		/usr/include/qt5/QtCore/qatomic_x86.h \
		/usr/include/qt5/QtCore/qatomic_cxx11.h \
		/usr/include/qt5/QtCore/qatomic_unix.h \
		/usr/include/qt5/QtCore/qmutex.h \
		/usr/include/qt5/QtCore/qlogging.h \
		/usr/include/qt5/QtCore/qflags.h \
		/usr/include/qt5/QtCore/qtypeinfo.h \
		/usr/include/qt5/QtCore/qtypetraits.h \
		/usr/include/qt5/QtCore/qsysinfo.h \
		/usr/include/qt5/QtCore/qobjectdefs.h \
		/usr/include/qt5/QtCore/qnamespace.h \
		/usr/include/qt5/QtCore/qobjectdefs_impl.h \
		/usr/include/qt5/QtGui/qwindowdefs_win.h \
		/usr/include/qt5/QtCore/qobject.h \
		/usr/include/qt5/QtCore/qstring.h \
		/usr/include/qt5/QtCore/qchar.h \
		/usr/include/qt5/QtCore/qbytearray.h \
		/usr/include/qt5/QtCore/qrefcount.h \
		/usr/include/qt5/QtCore/qarraydata.h \
		/usr/include/qt5/QtCore/qstringbuilder.h \
		/usr/include/qt5/QtCore/qlist.h \
		/usr/include/qt5/QtCore/qalgorithms.h \
		/usr/include/qt5/QtCore/qiterator.h \
		/usr/include/qt5/QtCore/qcoreevent.h \
		/usr/include/qt5/QtCore/qscopedpointer.h \
		/usr/include/qt5/QtCore/qmetatype.h \
		/usr/include/qt5/QtCore/qvarlengtharray.h \
		/usr/include/qt5/QtCore/qcontainerfwd.h \
		/usr/include/qt5/QtCore/qisenum.h \
		/usr/include/qt5/QtCore/qobject_impl.h \
		/usr/include/qt5/QtCore/qmargins.h \
		/usr/include/qt5/QtCore/qrect.h \
		/usr/include/qt5/QtCore/qsize.h \
		/usr/include/qt5/QtCore/qpoint.h \
		/usr/include/qt5/QtGui/qpaintdevice.h \
		/usr/include/qt5/QtGui/qpalette.h \
		/usr/include/qt5/QtGui/qcolor.h \
		/usr/include/qt5/QtGui/qrgb.h \
		/usr/include/qt5/QtCore/qstringlist.h \
		/usr/include/qt5/QtCore/qdatastream.h \
		/usr/include/qt5/QtCore/qiodevice.h \
		/usr/include/qt5/QtCore/qpair.h \
		/usr/include/qt5/QtCore/qregexp.h \
		/usr/include/qt5/QtCore/qstringmatcher.h \
		/usr/include/qt5/QtGui/qbrush.h \
		/usr/include/qt5/QtCore/qvector.h \
		/usr/include/qt5/QtGui/qmatrix.h \
		/usr/include/qt5/QtGui/qpolygon.h \
		/usr/include/qt5/QtGui/qregion.h \
		/usr/include/qt5/QtCore/qline.h \
		/usr/include/qt5/QtGui/qtransform.h \
		/usr/include/qt5/QtGui/qpainterpath.h \
		/usr/include/qt5/QtGui/qimage.h \
		/usr/include/qt5/QtGui/qpixmap.h \
		/usr/include/qt5/QtCore/qsharedpointer.h \
		/usr/include/qt5/QtCore/qshareddata.h \
		/usr/include/qt5/QtCore/qsharedpointer_impl.h \
		/usr/include/qt5/QtCore/qhash.h \
		/usr/include/qt5/QtGui/qfont.h \
		/usr/include/qt5/QtGui/qfontmetrics.h \
		/usr/include/qt5/QtGui/qfontinfo.h \
		/usr/include/qt5/QtWidgets/qsizepolicy.h \
		/usr/include/qt5/QtGui/qcursor.h \
		/usr/include/qt5/QtGui/qkeysequence.h \
		/usr/include/qt5/QtGui/qevent.h \
		/usr/include/qt5/QtCore/qvariant.h \
		/usr/include/qt5/QtCore/qmap.h \
		/usr/include/qt5/QtCore/qdebug.h \
		/usr/include/qt5/QtCore/qtextstream.h \
		/usr/include/qt5/QtCore/qlocale.h \
		/usr/include/qt5/QtCore/qset.h \
		/usr/include/qt5/QtCore/qcontiguouscache.h \
		/usr/include/qt5/QtCore/qurl.h \
		/usr/include/qt5/QtCore/qurlquery.h \
		/usr/include/qt5/QtCore/qfile.h \
		/usr/include/qt5/QtCore/qfiledevice.h \
		/usr/include/qt5/QtGui/qvector2d.h \
		/usr/include/qt5/QtGui/qtouchdevice.h \
		/usr/include/qt5/QtWidgets/qtabwidget.h \
		/usr/include/qt5/QtGui/qicon.h \
		/usr/include/qt5/QtCore/QTimer \
		/usr/include/qt5/QtCore/qtimer.h \
		/usr/include/qt5/QtCore/qbasictimer.h \
		/usr/include/qt5/QtCore/QTime \
		/usr/include/qt5/QtCore/qdatetime.h \
		/usr/include/qt5/QtWidgets/QLCDNumber \
		/usr/include/qt5/QtWidgets/qlcdnumber.h \
		/usr/include/qt5/QtWidgets/qframe.h \
		/usr/include/qt5/QtCore/qbitarray.h \
		/usr/include/qt5/QtWidgets/QListWidget \
		/usr/include/qt5/QtWidgets/qlistwidget.h \
		/usr/include/qt5/QtWidgets/qlistview.h \
		/usr/include/qt5/QtWidgets/qabstractitemview.h \
		/usr/include/qt5/QtWidgets/qabstractscrollarea.h \
		/usr/include/qt5/QtCore/qabstractitemmodel.h \
		/usr/include/qt5/QtCore/qitemselectionmodel.h \
		/usr/include/qt5/QtWidgets/qabstractitemdelegate.h \
		/usr/include/qt5/QtWidgets/qstyleoption.h \
		/usr/include/qt5/QtWidgets/qabstractspinbox.h \
		/usr/include/qt5/QtGui/qvalidator.h \
		/usr/include/qt5/QtCore/qregularexpression.h \
		/usr/include/qt5/QtWidgets/qslider.h \
		/usr/include/qt5/QtWidgets/qabstractslider.h \
		/usr/include/qt5/QtWidgets/qstyle.h \
		/usr/include/qt5/QtWidgets/qtabbar.h \
		/usr/include/qt5/QtWidgets/qrubberband.h \
		bogglesolver.h
	/usr/lib/x86_64-linux-gnu/qt5/bin/moc $(DEFINES) $(INCPATH) -I/usr/include/c++/4.8 -I/usr/include/x86_64-linux-gnu/c++/4.8 -I/usr/include/c++/4.8/backward -I/usr/lib/gcc/x86_64-linux-gnu/4.8/include -I/usr/local/include -I/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed -I/usr/include/x86_64-linux-gnu -I/usr/include bogglesolver.h -o moc_bogglesolver.cpp

compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: ui_bogglesolver.h
compiler_uic_clean:
	-$(DEL_FILE) ui_bogglesolver.h
ui_bogglesolver.h: bogglesolver.ui
	/usr/lib/x86_64-linux-gnu/qt5/bin/uic bogglesolver.ui -o ui_bogglesolver.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_uic_clean 

####### Compile

main.o: main.cpp bogglesolver.h \
		Boggle.h \
		Trie.h \
		Board.h \
		/usr/include/qt5/QtWidgets/QMainWindow \
		/usr/include/qt5/QtWidgets/qmainwindow.h \
		/usr/include/qt5/QtWidgets/qwidget.h \
		/usr/include/qt5/QtGui/qwindowdefs.h \
		/usr/include/qt5/QtCore/qglobal.h \
		/usr/include/qt5/QtCore/qconfig.h \
		/usr/include/qt5/QtCore/qfeatures.h \
		/usr/include/qt5/QtCore/qsystemdetection.h \
		/usr/include/qt5/QtCore/qprocessordetection.h \
		/usr/include/qt5/QtCore/qcompilerdetection.h \
		/usr/include/qt5/QtCore/qglobalstatic.h \
		/usr/include/qt5/QtCore/qatomic.h \
		/usr/include/qt5/QtCore/qbasicatomic.h \
		/usr/include/qt5/QtCore/qatomic_bootstrap.h \
		/usr/include/qt5/QtCore/qgenericatomic.h \
		/usr/include/qt5/QtCore/qatomic_msvc.h \
		/usr/include/qt5/QtCore/qatomic_integrity.h \
		/usr/include/qt5/QtCore/qoldbasicatomic.h \
		/usr/include/qt5/QtCore/qatomic_vxworks.h \
		/usr/include/qt5/QtCore/qatomic_power.h \
		/usr/include/qt5/QtCore/qatomic_alpha.h \
		/usr/include/qt5/QtCore/qatomic_armv7.h \
		/usr/include/qt5/QtCore/qatomic_armv6.h \
		/usr/include/qt5/QtCore/qatomic_armv5.h \
		/usr/include/qt5/QtCore/qatomic_bfin.h \
		/usr/include/qt5/QtCore/qatomic_ia64.h \
		/usr/include/qt5/QtCore/qatomic_mips.h \
		/usr/include/qt5/QtCore/qatomic_s390.h \
		/usr/include/qt5/QtCore/qatomic_sh4a.h \
		/usr/include/qt5/QtCore/qatomic_sparc.h \
		/usr/include/qt5/QtCore/qatomic_gcc.h \
		/usr/include/qt5/QtCore/qatomic_x86.h \
		/usr/include/qt5/QtCore/qatomic_cxx11.h \
		/usr/include/qt5/QtCore/qatomic_unix.h \
		/usr/include/qt5/QtCore/qmutex.h \
		/usr/include/qt5/QtCore/qlogging.h \
		/usr/include/qt5/QtCore/qflags.h \
		/usr/include/qt5/QtCore/qtypeinfo.h \
		/usr/include/qt5/QtCore/qtypetraits.h \
		/usr/include/qt5/QtCore/qsysinfo.h \
		/usr/include/qt5/QtCore/qobjectdefs.h \
		/usr/include/qt5/QtCore/qnamespace.h \
		/usr/include/qt5/QtCore/qobjectdefs_impl.h \
		/usr/include/qt5/QtGui/qwindowdefs_win.h \
		/usr/include/qt5/QtCore/qobject.h \
		/usr/include/qt5/QtCore/qstring.h \
		/usr/include/qt5/QtCore/qchar.h \
		/usr/include/qt5/QtCore/qbytearray.h \
		/usr/include/qt5/QtCore/qrefcount.h \
		/usr/include/qt5/QtCore/qarraydata.h \
		/usr/include/qt5/QtCore/qstringbuilder.h \
		/usr/include/qt5/QtCore/qlist.h \
		/usr/include/qt5/QtCore/qalgorithms.h \
		/usr/include/qt5/QtCore/qiterator.h \
		/usr/include/qt5/QtCore/qcoreevent.h \
		/usr/include/qt5/QtCore/qscopedpointer.h \
		/usr/include/qt5/QtCore/qmetatype.h \
		/usr/include/qt5/QtCore/qvarlengtharray.h \
		/usr/include/qt5/QtCore/qcontainerfwd.h \
		/usr/include/qt5/QtCore/qisenum.h \
		/usr/include/qt5/QtCore/qobject_impl.h \
		/usr/include/qt5/QtCore/qmargins.h \
		/usr/include/qt5/QtCore/qrect.h \
		/usr/include/qt5/QtCore/qsize.h \
		/usr/include/qt5/QtCore/qpoint.h \
		/usr/include/qt5/QtGui/qpaintdevice.h \
		/usr/include/qt5/QtGui/qpalette.h \
		/usr/include/qt5/QtGui/qcolor.h \
		/usr/include/qt5/QtGui/qrgb.h \
		/usr/include/qt5/QtCore/qstringlist.h \
		/usr/include/qt5/QtCore/qdatastream.h \
		/usr/include/qt5/QtCore/qiodevice.h \
		/usr/include/qt5/QtCore/qpair.h \
		/usr/include/qt5/QtCore/qregexp.h \
		/usr/include/qt5/QtCore/qstringmatcher.h \
		/usr/include/qt5/QtGui/qbrush.h \
		/usr/include/qt5/QtCore/qvector.h \
		/usr/include/qt5/QtGui/qmatrix.h \
		/usr/include/qt5/QtGui/qpolygon.h \
		/usr/include/qt5/QtGui/qregion.h \
		/usr/include/qt5/QtCore/qline.h \
		/usr/include/qt5/QtGui/qtransform.h \
		/usr/include/qt5/QtGui/qpainterpath.h \
		/usr/include/qt5/QtGui/qimage.h \
		/usr/include/qt5/QtGui/qpixmap.h \
		/usr/include/qt5/QtCore/qsharedpointer.h \
		/usr/include/qt5/QtCore/qshareddata.h \
		/usr/include/qt5/QtCore/qsharedpointer_impl.h \
		/usr/include/qt5/QtCore/qhash.h \
		/usr/include/qt5/QtGui/qfont.h \
		/usr/include/qt5/QtGui/qfontmetrics.h \
		/usr/include/qt5/QtGui/qfontinfo.h \
		/usr/include/qt5/QtWidgets/qsizepolicy.h \
		/usr/include/qt5/QtGui/qcursor.h \
		/usr/include/qt5/QtGui/qkeysequence.h \
		/usr/include/qt5/QtGui/qevent.h \
		/usr/include/qt5/QtCore/qvariant.h \
		/usr/include/qt5/QtCore/qmap.h \
		/usr/include/qt5/QtCore/qdebug.h \
		/usr/include/qt5/QtCore/qtextstream.h \
		/usr/include/qt5/QtCore/qlocale.h \
		/usr/include/qt5/QtCore/qset.h \
		/usr/include/qt5/QtCore/qcontiguouscache.h \
		/usr/include/qt5/QtCore/qurl.h \
		/usr/include/qt5/QtCore/qurlquery.h \
		/usr/include/qt5/QtCore/qfile.h \
		/usr/include/qt5/QtCore/qfiledevice.h \
		/usr/include/qt5/QtGui/qvector2d.h \
		/usr/include/qt5/QtGui/qtouchdevice.h \
		/usr/include/qt5/QtWidgets/qtabwidget.h \
		/usr/include/qt5/QtGui/qicon.h \
		/usr/include/qt5/QtCore/QTimer \
		/usr/include/qt5/QtCore/qtimer.h \
		/usr/include/qt5/QtCore/qbasictimer.h \
		/usr/include/qt5/QtCore/QTime \
		/usr/include/qt5/QtCore/qdatetime.h \
		/usr/include/qt5/QtWidgets/QLCDNumber \
		/usr/include/qt5/QtWidgets/qlcdnumber.h \
		/usr/include/qt5/QtWidgets/qframe.h \
		/usr/include/qt5/QtCore/qbitarray.h \
		/usr/include/qt5/QtWidgets/QListWidget \
		/usr/include/qt5/QtWidgets/qlistwidget.h \
		/usr/include/qt5/QtWidgets/qlistview.h \
		/usr/include/qt5/QtWidgets/qabstractitemview.h \
		/usr/include/qt5/QtWidgets/qabstractscrollarea.h \
		/usr/include/qt5/QtCore/qabstractitemmodel.h \
		/usr/include/qt5/QtCore/qitemselectionmodel.h \
		/usr/include/qt5/QtWidgets/qabstractitemdelegate.h \
		/usr/include/qt5/QtWidgets/qstyleoption.h \
		/usr/include/qt5/QtWidgets/qabstractspinbox.h \
		/usr/include/qt5/QtGui/qvalidator.h \
		/usr/include/qt5/QtCore/qregularexpression.h \
		/usr/include/qt5/QtWidgets/qslider.h \
		/usr/include/qt5/QtWidgets/qabstractslider.h \
		/usr/include/qt5/QtWidgets/qstyle.h \
		/usr/include/qt5/QtWidgets/qtabbar.h \
		/usr/include/qt5/QtWidgets/qrubberband.h \
		/usr/include/qt5/QtWidgets/QApplication \
		/usr/include/qt5/QtWidgets/qapplication.h \
		/usr/include/qt5/QtCore/qcoreapplication.h \
		/usr/include/qt5/QtCore/qeventloop.h \
		/usr/include/qt5/QtWidgets/qdesktopwidget.h \
		/usr/include/qt5/QtGui/qguiapplication.h \
		/usr/include/qt5/QtGui/qinputmethod.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

bogglesolver.o: bogglesolver.cpp bogglesolver.h \
		Boggle.h \
		Trie.h \
		Board.h \
		/usr/include/qt5/QtWidgets/QMainWindow \
		/usr/include/qt5/QtWidgets/qmainwindow.h \
		/usr/include/qt5/QtWidgets/qwidget.h \
		/usr/include/qt5/QtGui/qwindowdefs.h \
		/usr/include/qt5/QtCore/qglobal.h \
		/usr/include/qt5/QtCore/qconfig.h \
		/usr/include/qt5/QtCore/qfeatures.h \
		/usr/include/qt5/QtCore/qsystemdetection.h \
		/usr/include/qt5/QtCore/qprocessordetection.h \
		/usr/include/qt5/QtCore/qcompilerdetection.h \
		/usr/include/qt5/QtCore/qglobalstatic.h \
		/usr/include/qt5/QtCore/qatomic.h \
		/usr/include/qt5/QtCore/qbasicatomic.h \
		/usr/include/qt5/QtCore/qatomic_bootstrap.h \
		/usr/include/qt5/QtCore/qgenericatomic.h \
		/usr/include/qt5/QtCore/qatomic_msvc.h \
		/usr/include/qt5/QtCore/qatomic_integrity.h \
		/usr/include/qt5/QtCore/qoldbasicatomic.h \
		/usr/include/qt5/QtCore/qatomic_vxworks.h \
		/usr/include/qt5/QtCore/qatomic_power.h \
		/usr/include/qt5/QtCore/qatomic_alpha.h \
		/usr/include/qt5/QtCore/qatomic_armv7.h \
		/usr/include/qt5/QtCore/qatomic_armv6.h \
		/usr/include/qt5/QtCore/qatomic_armv5.h \
		/usr/include/qt5/QtCore/qatomic_bfin.h \
		/usr/include/qt5/QtCore/qatomic_ia64.h \
		/usr/include/qt5/QtCore/qatomic_mips.h \
		/usr/include/qt5/QtCore/qatomic_s390.h \
		/usr/include/qt5/QtCore/qatomic_sh4a.h \
		/usr/include/qt5/QtCore/qatomic_sparc.h \
		/usr/include/qt5/QtCore/qatomic_gcc.h \
		/usr/include/qt5/QtCore/qatomic_x86.h \
		/usr/include/qt5/QtCore/qatomic_cxx11.h \
		/usr/include/qt5/QtCore/qatomic_unix.h \
		/usr/include/qt5/QtCore/qmutex.h \
		/usr/include/qt5/QtCore/qlogging.h \
		/usr/include/qt5/QtCore/qflags.h \
		/usr/include/qt5/QtCore/qtypeinfo.h \
		/usr/include/qt5/QtCore/qtypetraits.h \
		/usr/include/qt5/QtCore/qsysinfo.h \
		/usr/include/qt5/QtCore/qobjectdefs.h \
		/usr/include/qt5/QtCore/qnamespace.h \
		/usr/include/qt5/QtCore/qobjectdefs_impl.h \
		/usr/include/qt5/QtGui/qwindowdefs_win.h \
		/usr/include/qt5/QtCore/qobject.h \
		/usr/include/qt5/QtCore/qstring.h \
		/usr/include/qt5/QtCore/qchar.h \
		/usr/include/qt5/QtCore/qbytearray.h \
		/usr/include/qt5/QtCore/qrefcount.h \
		/usr/include/qt5/QtCore/qarraydata.h \
		/usr/include/qt5/QtCore/qstringbuilder.h \
		/usr/include/qt5/QtCore/qlist.h \
		/usr/include/qt5/QtCore/qalgorithms.h \
		/usr/include/qt5/QtCore/qiterator.h \
		/usr/include/qt5/QtCore/qcoreevent.h \
		/usr/include/qt5/QtCore/qscopedpointer.h \
		/usr/include/qt5/QtCore/qmetatype.h \
		/usr/include/qt5/QtCore/qvarlengtharray.h \
		/usr/include/qt5/QtCore/qcontainerfwd.h \
		/usr/include/qt5/QtCore/qisenum.h \
		/usr/include/qt5/QtCore/qobject_impl.h \
		/usr/include/qt5/QtCore/qmargins.h \
		/usr/include/qt5/QtCore/qrect.h \
		/usr/include/qt5/QtCore/qsize.h \
		/usr/include/qt5/QtCore/qpoint.h \
		/usr/include/qt5/QtGui/qpaintdevice.h \
		/usr/include/qt5/QtGui/qpalette.h \
		/usr/include/qt5/QtGui/qcolor.h \
		/usr/include/qt5/QtGui/qrgb.h \
		/usr/include/qt5/QtCore/qstringlist.h \
		/usr/include/qt5/QtCore/qdatastream.h \
		/usr/include/qt5/QtCore/qiodevice.h \
		/usr/include/qt5/QtCore/qpair.h \
		/usr/include/qt5/QtCore/qregexp.h \
		/usr/include/qt5/QtCore/qstringmatcher.h \
		/usr/include/qt5/QtGui/qbrush.h \
		/usr/include/qt5/QtCore/qvector.h \
		/usr/include/qt5/QtGui/qmatrix.h \
		/usr/include/qt5/QtGui/qpolygon.h \
		/usr/include/qt5/QtGui/qregion.h \
		/usr/include/qt5/QtCore/qline.h \
		/usr/include/qt5/QtGui/qtransform.h \
		/usr/include/qt5/QtGui/qpainterpath.h \
		/usr/include/qt5/QtGui/qimage.h \
		/usr/include/qt5/QtGui/qpixmap.h \
		/usr/include/qt5/QtCore/qsharedpointer.h \
		/usr/include/qt5/QtCore/qshareddata.h \
		/usr/include/qt5/QtCore/qsharedpointer_impl.h \
		/usr/include/qt5/QtCore/qhash.h \
		/usr/include/qt5/QtGui/qfont.h \
		/usr/include/qt5/QtGui/qfontmetrics.h \
		/usr/include/qt5/QtGui/qfontinfo.h \
		/usr/include/qt5/QtWidgets/qsizepolicy.h \
		/usr/include/qt5/QtGui/qcursor.h \
		/usr/include/qt5/QtGui/qkeysequence.h \
		/usr/include/qt5/QtGui/qevent.h \
		/usr/include/qt5/QtCore/qvariant.h \
		/usr/include/qt5/QtCore/qmap.h \
		/usr/include/qt5/QtCore/qdebug.h \
		/usr/include/qt5/QtCore/qtextstream.h \
		/usr/include/qt5/QtCore/qlocale.h \
		/usr/include/qt5/QtCore/qset.h \
		/usr/include/qt5/QtCore/qcontiguouscache.h \
		/usr/include/qt5/QtCore/qurl.h \
		/usr/include/qt5/QtCore/qurlquery.h \
		/usr/include/qt5/QtCore/qfile.h \
		/usr/include/qt5/QtCore/qfiledevice.h \
		/usr/include/qt5/QtGui/qvector2d.h \
		/usr/include/qt5/QtGui/qtouchdevice.h \
		/usr/include/qt5/QtWidgets/qtabwidget.h \
		/usr/include/qt5/QtGui/qicon.h \
		/usr/include/qt5/QtCore/QTimer \
		/usr/include/qt5/QtCore/qtimer.h \
		/usr/include/qt5/QtCore/qbasictimer.h \
		/usr/include/qt5/QtCore/QTime \
		/usr/include/qt5/QtCore/qdatetime.h \
		/usr/include/qt5/QtWidgets/QLCDNumber \
		/usr/include/qt5/QtWidgets/qlcdnumber.h \
		/usr/include/qt5/QtWidgets/qframe.h \
		/usr/include/qt5/QtCore/qbitarray.h \
		/usr/include/qt5/QtWidgets/QListWidget \
		/usr/include/qt5/QtWidgets/qlistwidget.h \
		/usr/include/qt5/QtWidgets/qlistview.h \
		/usr/include/qt5/QtWidgets/qabstractitemview.h \
		/usr/include/qt5/QtWidgets/qabstractscrollarea.h \
		/usr/include/qt5/QtCore/qabstractitemmodel.h \
		/usr/include/qt5/QtCore/qitemselectionmodel.h \
		/usr/include/qt5/QtWidgets/qabstractitemdelegate.h \
		/usr/include/qt5/QtWidgets/qstyleoption.h \
		/usr/include/qt5/QtWidgets/qabstractspinbox.h \
		/usr/include/qt5/QtGui/qvalidator.h \
		/usr/include/qt5/QtCore/qregularexpression.h \
		/usr/include/qt5/QtWidgets/qslider.h \
		/usr/include/qt5/QtWidgets/qabstractslider.h \
		/usr/include/qt5/QtWidgets/qstyle.h \
		/usr/include/qt5/QtWidgets/qtabbar.h \
		/usr/include/qt5/QtWidgets/qrubberband.h \
		ui_bogglesolver.h \
		/usr/include/qt5/QtWidgets/QTableWidget \
		/usr/include/qt5/QtWidgets/qtablewidget.h \
		/usr/include/qt5/QtWidgets/qtableview.h \
		/usr/include/qt5/QtWidgets/QVBoxLayout \
		/usr/include/qt5/QtWidgets/qboxlayout.h \
		/usr/include/qt5/QtWidgets/qlayout.h \
		/usr/include/qt5/QtWidgets/qlayoutitem.h \
		/usr/include/qt5/QtWidgets/qgridlayout.h \
		/usr/include/qt5/QtWidgets/QHBoxLayout \
		/usr/include/qt5/QtWidgets/QDialog \
		/usr/include/qt5/QtWidgets/qdialog.h \
		/usr/include/qt5/QtGui/QColor
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o bogglesolver.o bogglesolver.cpp

Boggle.o: Boggle.cpp Boggle.h \
		Trie.h \
		Board.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o Boggle.o Boggle.cpp

Board.o: Board.cpp Board.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o Board.o Board.cpp

Trie.o: Trie.cpp Trie.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o Trie.o Trie.cpp

moc_bogglesolver.o: moc_bogglesolver.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_bogglesolver.o moc_bogglesolver.cpp

####### Install

install:   FORCE

uninstall:   FORCE

FORCE:

