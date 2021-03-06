#!/bin/bash

# This script compilies ParaView (v5.1.2) with Mesa-LLVM.
# First, Cmake creates the Makefile in accordance with the flags.
# Then, "make -j8" and "make install" are executed.

cmake -D BUILD_DOCUMENTATION:BOOL=OFF \
      -D BUILD_EXAMPLES:BOOL=OFF \
      -D BUILD_SHARED_LIBS:BOOL=ON \
      -D BUILD_TESTING:BOOL=OFF \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=/root \
      -D PARAVIEW_BUILD_QT_GUI:BOOL=OFF \
      -D PARAVIEW_DATA_ROOT=/root/build \
      -D PARAVIEW_ENABLE_COPROCESSING:BOOL=ON \
      -D PARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON \
      -D PARAVIEW_USE_VISITBRIDGE:BOOL=ON \
      -D VTK_RENDERING_BACKEND=OpenGL2 \
      -D VTK_USE_X:BOOL=ON \
      -D VTK_OPENGL_HAS_OSMESA:BOOL=ON \
      -D VTK_USE_OFFSCREEN:BOOL=ON \
      -D OPENGL_INCLUDE_DIR=/usr/include \
      -D OPENGL_xmesa_INCLUDE_DIR= \
      -D OPENGL_gl_LIBRARY=/lib/libGL.so \
      -D OPENGL_glu_LIBRARY= \
      -D OSMESA_LIBRARY=/lib/libOSMesa.so \
      -D PARAVIEW_ENABLE_PYTHON:BOOL=ON \
      -D PYTHON_LIBRARY=/usr/lib64/libpython2.7.so \
      -D PYTHON_INCLUDE_DIR=/usr/include/python2.7 \
      -D PYTHON_EXECUTABLE=/usr/bin/python \
      -D PARAVIEW_USE_MPI:BOOL=ON \
      -D MPI_C_LIBRARIES=/usr/lib64/mpich/lib/libmpich.so \
      -D MPI_C_INCLUDE_PATH=/usr/include/mpich-x86_64 \
      -D MPI_Fortran_LIBRARIES=/usr/lib64/mpich/lib/libmpichf90.so \
      -D MPI_Fortran_INCLUDE_PATH=/usr/include/mpich-x86_64 \
      -D MPI_CXX_INCLUDE_PATH=/usr/include/mpich-x86_64 \
      -D MPI_CXX_LIBRARIES=/usr/lib64/mpich/lib/libmpichcxx.so \
      -D PARAVIEW_ENABLE_FFMPEG:BOOL=ON \
      -D VTK_USE_FFMPEG_ENCODER:BOOL=ON \
      -D FFMPEG_INCLUDE_DIR=/usr/local/include \
      -D Boost_INCLUDE_DIR=/usr/include \
      /root/ParaView_src

make -j8
make install

