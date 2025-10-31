import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_painter/app/presentation/build_backgrodund.dart';
import 'package:simple_painter/app/presentation/gallery/cubit/gallery_cubit.dart';
import 'package:simple_painter/app/presentation/gallery/widget/color_picker_dialog.dart';
import 'package:simple_painter/app/presentation/gallery/widget/drawing_painter.dart';
import 'package:simple_painter/app/presentation/gallery/widget/stroke_picker.dart';
import 'package:simple_painter/core/services/native_share_service.dart';
import 'package:simple_painter/main.dart';
import 'package:simple_painter/shared/utils/app_bar.dart';
import 'package:simple_painter/shared/utils/pick_image.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:simple_painter/shared/utils/snackbar.dart';

class NewPhotoScreen extends StatefulWidget {
  const NewPhotoScreen({super.key});

  @override
  State<NewPhotoScreen> createState() => _NewPhotoScreenState();
}

class _NewPhotoScreenState extends State<NewPhotoScreen> {
  final List<Offset?> _points = [];

  Color _currentColor = Colors.red;

  double _strokeWidth = 4.0;

  void _pickColor() async {
    final color = await showDialog<Color>(
      context: context,
      builder: (_) => ColorPickerDialog(currentColor: _currentColor),
    );
    if (color != null) setState(() => _currentColor = color);
  }

  void _pickStrokeWidth() async {
    final strokeWidth = await showDialog<double>(
      context: context,
      builder: (_) => StrokeWidthPickerDialog(strokeWidth: _strokeWidth),
    );
    if (strokeWidth != null) setState(() => _strokeWidth = strokeWidth);
  }

  //File? file;
  ui.Image? _uiImage;
  void _pickImage(BuildContext context) async {
    try {
      File? galleryFile = await pickImage(context, ImageSource.gallery);

      if (galleryFile != null) {
        // setState(() {
        //   file = galleryFile;
        // });
        final uint8List = await galleryFile.readAsBytes();
        ui.Image myBackground = await decodeImageFromList(uint8List);
        setState(() {
          _uiImage = myBackground;
        });
      }
    } catch (e) {
      logger.e(
        'Error while fetching Image from gallery or while converting to uiImage',
      );
    }
  }

  Future<void> _saveFileToGallery(File file) async {
    // try {
    //   bool? success = await GallerySaver.saveImage(file.path);
    //   if (success == true) {
    //     print('Image saved to gallery!');
    //   } else {
    //     print('Failed to save image.');
    //   }
    // } catch (e) {
    //   print('Error saving image: $e');
    // }
  }

  //   void loadImageFromFirebase(String storagePath) async {
  //   try {
  //     // 'images/abc.jpg'
  //     final ref = FirebaseStorage.instance.ref().child(storagePath);

  //     final maxSize = 10 * 1024 * 1024;
  //     final Uint8List? data = await ref.getData(maxSize);

  //     if (data == null) throw Exception('No data from storage');

  //     final ui.Image image = await decodeImageFromList(data);
  //     setState(() {
  //       _uiImage = image;
  //     });
  //   } catch (e, st) {
  //
  //     print('Error loading image from Firebase: $e\n$st');
  //   }
  // }

  void _clear() => setState(() => _points.clear());

  final _repaintBoundaryKey = GlobalKey();

  Uint8List? _capturedImageBytes;
  Future<Uint8List?> _capturePng() async {
    try {
      final RenderRepaintBoundary boundary =
          _repaintBoundaryKey.currentContext!.findRenderObject()!
              as RenderRepaintBoundary;

      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);

      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      return byteData?.buffer.asUint8List();
    } catch (e) {
      logger.e('Error _capturePng method: while capturing png');
      return null;
    }
  }

  // Future<XFile?> _convertToFile() async {
  //   final bytes = await _capturePng();
  //   if (bytes != null) {
  //     return XFile.fromData(
  //       bytes,
  //       name: 'my_drawing.png',
  //       mimeType: 'image/png',
  //     );
  //   }
  //   return null;
  // }

  Future<File?> _convertToFile() async {
    final Uint8List? bytes = await _capturePng();
    if (bytes != null) {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/my_drawing.png');
      await file.writeAsBytes(bytes);

      return File(file.path);
    }
    return null;
  }

  void sendImageAndSaveToGallery(BuildContext context) async {
    try {
      final File? file = await _convertToFile();
      if (file != null) {
        await _saveFileToGallery(file);
        if (context.mounted) {
          context.read<ImagesCubit>().upload(File(file.path), 'name', 'author');
        }
      }
    } catch (e) {
      logger.e('Error, method: sendImageAndSaveToGallery, $e');
      if (context.mounted) {
        showSnackBar1(context, e.toString());
      }
    }
  }

  Future<void> _shareImageNatively() async {
    final bytes = await _capturePng();
    if (bytes != null) {
      await NativeShareService.shareBytesAsFile(
        bytes,
        name: 'my_drawing.png',
        text: 'рисунок',
      );
    }
  }

  Widget _buildPainterWidget() {
    return AspectRatio(
      aspectRatio: 0.75,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onPanStart: (details) {
            setState(() {
              _points.add(details.localPosition);
            });
          },
          onPanUpdate: (details) {
            setState(() {
              _points.add(details.localPosition);
            });
          },
          onPanEnd: (details) {
            _points.add(null);
          },
          child: Container(
            color: Colors.white,

            child: RepaintBoundary(
              key: _repaintBoundaryKey,
              child: CustomPaint(
                painter: DrawingPainter(
                  points: _points,
                  color: _currentColor,
                  strokeWidth: _strokeWidth,
                  myBackground: _uiImage,
                ),
                size: Size.infinite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildIcon(
          svgPath: 'assets/icons/download.svg',
          onTap: _shareImageNatively,
        ),
        _buildIcon(
          svgPath: 'assets/icons/gallery.svg',
          onTap: () => _pickImage(context),
        ),
        _buildIcon(svgPath: 'assets/icons/pencil.svg', onTap: _pickStrokeWidth),
        _buildIcon(svgPath: 'assets/icons/clear.svg', onTap: _clear),
        _buildIcon(svgPath: 'assets/icons/palette.svg', onTap: _pickColor),
      ],
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      titleText: 'Новое изображение',
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SvgPicture.asset(
          'assets/icons/arrow_left.svg',
          height: 24,
          width: 24,
        ),
      ),
      action: GestureDetector(
        onTap: () => sendImageAndSaveToGallery(context),
        // () async {
        //   final bytes = await _capturePng();
        //   if (bytes != null) {
        //     setState(() {
        //       _capturedImageBytes = bytes;
        //     });
        //   }

        // },
        child: SvgPicture.asset(
          'assets/icons/ready.svg',
          height: 24,
          width: 24,
        ),
      ),
    );
  }

  Widget _buildIcon({required String svgPath, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(9),
        width: 38,
        height: 38,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white.withValues(alpha: 0.20),
          shape: CircleBorder(),
        ),
        child: SvgPicture.asset(svgPath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  24.verticalSpace,
                  _buildButtons(context),
                  24.verticalSpace,
                  _buildPainterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
